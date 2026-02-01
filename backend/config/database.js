// MySQL credentials as variables
const MYSQL_DATABASE = 'railway';
const MYSQL_ROOT_PASSWORD = 'XHivqtHqYfewwRrfwnUwvitIsfcZyMkA';
const MYSQLDATABASE = 'railway';
const MYSQLHOST = process.env.DB_HOST || 'localhost';
const MYSQLPASSWORD = process.env.DB_PASSWORD || '';
const MYSQLPORT = process.env.DB_PORT || 3306;
const MYSQLUSER = process.env.DB_USER || 'root';

import { Sequelize } from 'sequelize';
import dotenv from 'dotenv';
import path from 'path';

dotenv.config({ path: path.resolve(process.cwd(), '..', '.env') });

const sequelize = new Sequelize(
  // process.env.DB_NAME || 'gcashdb',
  // process.env.DB_USER || 'root',
  // process.env.DB_PASSWORD || '',
  
  
  DB_USER='root',
  DB_PASSWORD='XHivqtHqYfewwRrfwnUwvitIsfcZyMkA',
  DB_NAME='railway',
  {
    host: process.env.DB_HOST || 'localhmysql.railway.internalost',
    port: process.env.DB_PORT || 3306,
    dialect: 'mysql',
    logging: false,
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000
    }
  }
);

export default sequelize;