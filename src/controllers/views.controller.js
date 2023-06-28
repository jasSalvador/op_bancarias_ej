/* export const goCliente = async(req, res) => {
    try{
        res.render('cliente');
    }catch(error){
        if(error.code){
            let messageError = returnError(error);
            console.log('Error al cargar Registro: ',messageError)
        }
    }
} */
import db from '../config/db.config.js'

export const goHome = async (req, res) => {
    try {
        let result = 1;
        res.render('home');
    } catch (error) {
        if (error.code) {
            let messageError = returnError(error);
            console.log('Error al cargar Registro: ', messageError)
        }
    }
}


export const formRegistro = async (req, res) => {
    try {
        let result = 1;
        res.render('registro');
    } catch (error) {
        if (error.code) {
            let messageError = returnError(error);
            console.log('Error al cargar Registro: ', messageError)
        }
    }
}

export const table = async (req, res) => {
    try {
        let result = 1;
        res.render('cliente');
    } catch (error) {
        if (error.code) {
            let messageError = returnError(error);
            console.log('Error al cargar Registro: ', messageError)
        }
    }
}

export const goCreditos = async (req, res) => {
    try {
        let result = 1;
        res.render('creditos');
    } catch (error) {
        if (error.code) {
            let messageError = returnError(error);
            console.log('Error al cargar Registro: ', messageError)
        }
    }
}

export const validarLogin = async (req, res) => {
    let { password, rut } = req.body;
    let result = await db.query("SELECT * FROM usuarios WHERE clave = $1 and rut = $2", [
        password, rut
    ])
    let usuario = result.rows[0];
    console.log(usuario)
    if (!usuario) {
        return res.send("Credenciales no validas.")
    }

    res.render("cliente", {
        usuario: usuario.nombre,
        mensaje: "hola"
    })
}