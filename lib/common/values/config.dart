// 开发环境
const ENV = 'DEV';
const SERVER_HOST_DEV = 'http://10.1.1.108:7008';

// 生产环境
// 生产环境地址禁止随意修改！！！
const SERVER_HOST_PROD = '';

const SERVER_API_URL = ENV_IS_DEV ? SERVER_HOST_DEV : SERVER_HOST_PROD;

const ENV_IS_DEV = ENV == "DEV";

