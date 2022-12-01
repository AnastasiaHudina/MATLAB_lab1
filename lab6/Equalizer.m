classdef Equalizer < handle
    properties (Constant)
        freqArray  = [31, 62, 125, 250, 500, 1000, 2000, 4000, 8000,16000];
    end
    properties (Access = public)
        gain = ones(length(freqArray), 1);
    end
    properties (GetAccess = public, SetAccess = private)
        order = 64;
    end 
    properties (GetAccess = public, SetAccess = protected)
        bBank;
    end
    properties (GetAccess = public, SetAccess = private)
        fS = 44100;
    end
    properties (Access = protected)
        initB = [];
    end
    methods
        function obj = Equalizer(order, fS)
            obj.order = order;
            obj.fS = fS;
            obj.bBank = CreateFilters(obj);
        end
        function [signalOut, initB] = Filtering(obj, signal)
            b = sum(obj.gain .* obj.bBank, 1);
            [signalOut, initB] = filter(b, 1, signal, obj.initB);
        end
        function bBank = CreateFilters(obj)
            freqArrayNorm = obj.freqArray/(obj.fS/2);
            obj.bBank = [];
            mLow = [1, 1, 0, 0];
            mBand = [0, 0, 1, 0, 0]; 
            mHigh = [0, 0, 1, 1];
            bBank = zeros(length(obj.freqArray), obj.order + 1);
            for k = 1:length(obj.freqArray)
                if k==1
                    freqLow = [0, freqArrayNorm(k), 2*freqArrayNorm(k), 1];
                    bBank(k,:) = fir2(obj.order, freqLow, mLow); 
                elseif k==length(obj.freqArray)
                    freqHigh = [0, freqArrayNorm(k)/2, freqArrayNorm(k), 1];
                    bBank(k,:) = fir2(obj.order, freqHigh, mHigh);
                else 
                    freqBand = [0, freqArrayNorm(k-1), freqArrayNorm(k), freqArrayNorm(k+1), 1];
                    bBank(k,:) = fir2(obj.order, freqBand, mBand);
                end
            end
        end
        function [H_db, w] = GetFreqResponse(obj)
            x_db =@(x)20 * log10(x);
            b = sum(obj.gain.*obj.bBank);
            [H, w] = freqz(b, 1, obj.order);
            H_db = x_db(abs(H));
            w = (w / pi) * (obj.fS / 2);
        end
     end
end    

        
    