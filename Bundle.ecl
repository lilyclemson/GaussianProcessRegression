/*##############################################################################
## HPCC SYSTEMS software Copyright (C) 2022 HPCC Systems.  All rights reserved.
############################################################################## */
IMPORT Std;
EXPORT Bundle := MODULE(Std.BundleBase)
  EXPORT Name := 'GaussianProcessRegression';
  EXPORT Description := 'RFF-accelerated Gaussian Process Regression';
  EXPORT Authors := ['HPCCSystems'];
  EXPORT License := 'http://www.apache.org/licenses/LICENSE-2.0';
  EXPORT Copyright := 'Copyright (C) 2022 HPCC Systems®';
  EXPORT DependsOn := ['ML_Core'];
  EXPORT Version := '1.0';
  EXPORT PlatformVersion := '8.4.0';
END;
