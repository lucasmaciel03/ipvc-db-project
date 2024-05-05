import express from "express";
import cors from "cors";
import morgan from "morgan";
import "dotenv/config.js";
import { routes } from "./routes.js";
import { dbInstance } from "./config/db.js";

const app = express();

const clienteURL = "*";

const corsOptions = {
    origin: clienteURL,
};
app.use(cors(corsOptions));

app.use(morgan("short"));

app.use(express.json())

app.use(express.urlencoded({ extended: true }));

app.use("/api", routes);

//Fazer ligação à Base de Dados
try {
    dbInstance.sync({ force: false, alter: true });
} catch (error) {
    console.info(error);
}

// correr server no url host:port definido em .env
app.listen(process.env.SERVER_PORT, process.env.SERVER_HOST, () => {
    console.log(
        "Server up and running at http://%s:%s",
        process.env.SERVER_HOST,
        process.env.SERVER_PORT
    );
});