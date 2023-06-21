import db from '../config/db.config.js'

class Cuentas {
    constructor(rut, n_cuenta, tipo) {
        this.rut = rut;
        this.n_cuenta = n_cuenta;
        this.tipo = tipo;
    }

    static findAll() {
        return new Promise(async (resolve, reject) => {
            try {
                let result = await db.query(
                    "SELECT rut, n_cuenta, tipo FROM Cuentas"
                );
                resolve(result);
            } catch (error) {
                console.log(error)
                reject(error)
            }
        });
    };

    static findBy(n_cuenta) {
        return new Promise(async (resolve, reject) => {
            try {
                let result = await db.query(
                    "SELECT rut, n_cuenta, tipo FROM cuentas where n_cuenta = $1",
                    [n_cuenta]
                );
                resolve(result);
            } catch (error) {
                console.log(error)
                reject(error)
            }
        });
    };

    createCuenta() {
        return new Promise(async (resolve, reject) => {
            try {
                let query = {
                    text: `INSERT INTO cuentas(rut, n_cuenta, tipo) VALUES($1,$2,$3) returning rut, n_cuenta, tipo`,
                    values: [this.rut, this.n_cuenta, this.tipo],
                };
                let result = await db.query(query);
                return resolve(result);
            } catch (error) {
                console.log(error)
                reject(error);
            }
        })
    };

    static updateCuenta(rut, n_cuenta, tipo) {
        return new Promise(async (resolve, reject) => {
            try {
                let query = {
                    text: 'UPDATE cuentas SET rut=$1, tipo=$3 WHERE n_cuenta = $2',
                    values: [rut, n_cuenta, tipo],
                };
                let result = await db.query(query);
                return resolve(result);
            } catch (error) {
                reject(error);
            }
        });
    }

    static deleteCuenta(n_cuenta) {
        return new Promise(async (resolve, reject) => {
            try {
                let query = {
                    text: `DELETE FROM cuentas WHERE n_cuenta=$1`,
                    values: [n_cuenta],
                };
                let result = await db.query(query);
                return resolve(result);
            } catch (error) {
                reject(error)
            }
        })
    }
};

export default Cuentas;