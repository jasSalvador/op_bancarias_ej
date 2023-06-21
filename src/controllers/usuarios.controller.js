import Usuarios from "../models/Usuarios.js";
import returnError from '../config/errorPostgres.js';

export const getUsuarios = async (req, res) => {
    try {
        let usuarios = await Usuarios.findAll();
        res.send({
            status:200,
            data:usuarios.rows,
            message:'Usuarios obtenidos con exito'
        })
    } catch(error) {
        if(error.code){
            let messageError = returnError(error);
            console.log('Error al cargar usuarios: ',messageError);
        }
    }
}

export const getUsuarioBy = async (req, res) => {
    try {
        let {id} = req.params;
        let result = await Usuarios.findBy(id);
        res.send({
            code:200,
            data:result.rows,
            message:'Usuario por ID obtenido con exito'
        })
    }catch(error){
        if(error.code){
            let messageError = returnError(error);
            console.log('Error al buscar usuario por id: ', messageError);
        }
    }
}

export const createUsuario = async (req, res) => {
    try {
        let {rut, clave, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, email, telefono} = req.body;
        let nuevoUsuario = new Usuarios(rut, clave, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, email, telefono);
        console.log(rut, clave, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, email, telefono);
        let result = await nuevoUsuario.createUsuario();
        res.send({
            code:200,
            data:result.rows,
            message:'Usuario creado con exito'
        })
    } catch (error) {
        if(error.code){
            let messageError = returnError(error);
            console.log('Error al crear un usuario: ', messageError);
        }
    }
}

export const updateUsuario = async (req, res) => {
    try {
        let {rut} = req.params
        let {clave, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, email, telefono} = req.body;
        let result = await Usuarios.updateUsuario(rut, clave, nombre, primer_apellido, segundo_apellido, fecha_nacimiento, email, telefono);
        res.send({
            code:200,
            data:result.rows,
            message:'Usuario actualizado con exito'
        })
    } catch(error) {
        if(error.code){
            let messageError = returnError(error);
            console.log('Error al actualizar usuario: ', messageError);
        }
    }
}
export const deleteUsuario = async (req, res) => {
    try {
        let {rut} = req.params;
        let result = await Usuarios.deleteUsuario(rut);
        res.send({
            code:200,
            data:result.rows,
            message:'Usuario Eliminado con exito'
        })
    } catch(error) {
        if(error.code){
            let messageError = returnError(error);
            console.log('Error al eliminar usuario: ', messageError)
        }
    }
}
