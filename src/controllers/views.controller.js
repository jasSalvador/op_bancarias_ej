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
    let resultUsuario = await db.query(
        "SELECT * FROM usuarios INNER JOIN cuentas ON usuarios.rut = cuentas.rut WHERE usuarios.clave = $1 and usuarios.rut = $2",
        [password, rut]
    );
    let usuarioCuentas = resultUsuario.rows;
    if (!usuarioCuentas) {
        return res.send("Credenciales no validas.");
    }

    usuarioCuentas = usuarioCuentas.map((usuario, index) => {
        usuario.index = index;
        return usuario;
    })

    console.log(usuarioCuentas);
    res.render("cliente", {
        usuarioCuentas
    });
};
