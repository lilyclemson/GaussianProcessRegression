/*##############################################################################
## HPCC SYSTEMS software Copyright (C) 2022 HPCC Systems.  All rights reserved.
############################################################################## */
IMPORT ML_Core;
IMPORT ML_Core.Types;
IMPORT PBblas;
IMPORT PBblas.Types as pbbTypes;
IMPORT PBblas.Converted as pbbConverted;
IMPORT PBblas.MatUtils;
IMPORT ML_Core.Math as Math;

NumericField := Types.NumericField;
empty_data := DATASET([], NumericField);

EXPORT score(DATASET(NumericField) X=empty_data, DATASET(NumericField) y=empty_data,
                                        DATASET(NumericField) Yhat=empty_data) := MODULE

  SHARED NumericField transYYhat(NumericField l, NumericField r) := TRANSFORM
    SELF.value := l.value * r.value;
    SELF       := l;
  END;
  SHARED YYhat := JOIN(Y, Yhat, LEFT.wi=RIGHT.wi AND RIGHT.id=LEFT.id AND LEFT.number=RIGHT.number,
                    transYYhat(LEFT, RIGHT));
  EXPORT sumX := SUM(y, value);
  EXPORT sumy := SUM(yhat, value);
  EXPORT sumYY := SUM(yyhat, value);
  EXPORT n := COUNT(y);
  EXPORT x2 := PROJECT(y, TRANSFORM(NumericField, SELF.value := LEFT.value * LEFT.value, SELF := LEFT));
  EXPORT sumX2 := SUM(x2, value);
  EXPORT y2 := PROJECT(yhat, TRANSFORM(NumericField, SELF.value := LEFT.value * LEFT.value, SELF := LEFT));
  EXPORT sumY2 := SUM(y2, value);
  EXPORT p1 := n * sumYY - sumX*sumY;
  EXPORT p2 := (n*sumX2 - sumX*sumX)*(n*sumY2-sumY*sumY);
  EXPORT r := p1/ SQRT(p2);
  EXPORT r2 := r * r;
END;