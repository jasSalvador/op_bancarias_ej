import { createCuenta, deleteCuenta, getCuentaById, getCuentas, updateCuenta} from '../controllers/cuentas.controller.js';
import { createUsuario, deleteUsuario, getUsuarioBy, getUsuarios, updateUsuario } from '../controllers/usuarios.controller.js';
import { createTransaccion, updateTransaccion, deleteTransaccion, getTransaccion, getTransaccionBy } from '../controllers/transacciones.controller.js';
import {Router} from 'express';
import {goHome, goCliente} from '../controllers/views.controller.js'
const router = Router();


//Rutas a views
router.get('/', goHome)
router.get('/cliente', goCliente)




//Rutas para acceder a la tabla Cuentas
router.get('/cuentas', getCuentas)
router.get('/cuentas/:n_cuenta', getCuentaById)
router.post('/cuentas', createCuenta)
router.put('/cuentas/:n_cuenta', updateCuenta)
router.delete('/cuentas/:n_cuenta', deleteCuenta)

//Rutas para acceder a Usuarios
router.get('/usuarios', getUsuarios)
router.get('/usuarios/:rut', getUsuarioBy)
router.post('/usuarios', createUsuario)
router.put('/usuarios/:rut', updateUsuario)
router.delete('/usuarios/:rut', deleteUsuario)

//Rutas para acceder a registros
router.get('/transacciones', getTransaccion)
router.get('/transacciones/:n_operacion', getTransaccionBy)
router.post('/transacciones', createTransaccion)
router.put('/transacciones/:n_operacion', updateTransaccion)
router.delete('/transacciones/:n_operacion', deleteTransaccion)




export default router;


