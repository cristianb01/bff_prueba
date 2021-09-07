const consfigDev = {
  'FB_FUNCTIONS_URL': 'https://10.0.2.2:8000/bff-69140/us-central1/api',
  'ENV': 'dev'
};

const configProd = {'FB_FUNCTIONS_URL': '', 'ENV': 'prod'};

String environment() {
  const variable = String.fromEnvironment('ENV');
  return variable;
}

final bool isProduction = environment() == 'prod';

final env = isProduction ? configProd : consfigDev;
