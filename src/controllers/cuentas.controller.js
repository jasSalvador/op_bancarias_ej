import Cuentas from "../models/Cuentas.js";
import returnError from "../config/errorPostgres.js";

export const getCuentas = async (req, res) => {
    try {
        let cuenta = await Cuentas.findAll();
        res.send({
            code: 200,
            data: cuenta.rows,
            message: 'Ok'
        })

    } catch (error) {
        if(error.code){
            let messageError = returnError(error);
            console.log('Error al buscar todas las cuentas: ', messageError);
        }
    }
}

export const getCuentaById = async (req, res) => {
    try {
        let { n_cuenta } = req.params
        let cuenta = await Cuentas.findBy(n_cuenta);
        res.send({
            code: 200,
            data: cuenta.rows,
            message: 'Encontrado.'
        })
    } catch (error) {
        if(error.code){
            let messageError = returnError(error);
            console.log('Error en buscar por n_cuenta: ', messageError)
        }
    }
}

export const createCuenta = async (req, res) => {
    try {
        let { rut, n_cuenta, tipo } = req.body;
        let nuevaCuenta = new Cuentas(rut, n_cuenta, tipo);
        let result = await nuevaCuenta.createCuenta()
        res.send({
            code:200,
            data:result.rows,
            message:'Cuenta creada con exito'
        })
    } catch (error) {
        if(error.code){
            let messageError = returnError(error);
            console.log("Error en creacion de cuenta: ", messageError)
        }
    }
}

export const updateCuenta = async (req, res) => {
    try {
        let {n_cuenta} = req.params;
        let { rut, tipo } = req.body;
        let result = await Cuentas.updateCuenta(rut, n_cuenta, tipo)
        res.send({
            code:200,
            data:result.rows,
            message:"Actualizado correctamente"
        })
    } catch (error){
        if(error.code){
            let messageError = returnError(error);
            console.log('Error al actualizar cuenta: ', messageError)
        }
    }
}

export const deleteCuenta = async (req, res) => {
    try {
        let {n_cuenta} = req.params;
        let result = await Cuentas.deleteCuenta(n_cuenta);
        res.send({
            code:200,
            data:result.rows,
            message:`Cuenta con n_cuenta: ${n_cuenta} eliminado`
        })
    } catch (error){
        if(error.code){
            let messageError = returnError(error);
            console.log('Error al eliminar cuenta: ', messageError)
        }
    }
};