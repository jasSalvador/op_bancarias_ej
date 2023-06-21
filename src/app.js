import express from 'express';
import cors from 'cors';
import { create } from 'express-handlebars';
import router from './routes/routes.js';
import { fileURLToPath } from 'url';
import path, { dirname } from 'path';
import viewsRouter from './routes/routes.js'


// Get the current file path and directory name
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);


// Execute express
const app = express();


// Create handlebars instance
const hbs = create({
    partialsDir: [path.join(__dirname, 'views/partials')],
});


//Configure handlebars as the template engine for rendering
app.engine('handlebars', hbs.engine);
app.set('view engine', 'handlebars');
app.set('views', path.join(__dirname, 'views'));


//MIDDLEWARES
app.use(express.json());
app.use(cors());


//publicamos botstrap
//app.use('/bootstrap', express.static(path.join(__dirname+'/node_modules/bootstrap/dist/'))); 
//app.use('/bootstrap', express.static(__dirname+'/node_modules/bootstrap/dist/')); 
app.use('/bootstrap', express.static('./node_modules/bootstrap/dist/'));

// Publish the 'public' folder
app.use(express.static('public'));


//ROUTES
app.use('/api/', router)


//Registrar rutas desde /
app.use('/', viewsRouter);


export default app;