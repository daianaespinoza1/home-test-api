function fn() {
  var config = {};
  var baseUrl = karate.properties['baseUrl'] || java.lang.System.getenv('BASE_URL');
  if (!baseUrl) {
    baseUrl = 'http://localhost:3100/api';
  }
  config.baseUrl = baseUrl;
  karate.log('Using baseUrl:', config.baseUrl);
  return config;
}
