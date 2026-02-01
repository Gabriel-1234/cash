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
  'railway', // MYSQLDATABASE
  'root',    // MYSQLUSER
  'XHivqtHqYfewwRrfwnUwvitIsfcZyMkA', // MYSQLPASSWORD
  {
    host: 'localhmysql.railway.internalost', // MYSQLHOST
    port: 3306, // MYSQLPORT
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