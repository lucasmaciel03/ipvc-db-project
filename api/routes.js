import Router from "express";
import { locRoutes } from "./routes/rt_locations.js";
import { niveisRoutes } from "./routes/rt_niveis.js";
import { areasRoutes } from "./routes/rt_areas.js";
import { generosRoutes } from "./routes/rt_generos.js";
import { referenciasRoutes } from "./routes/rt_referencias.js";

const routes = Router();

routes.get("/", (req, res) => {
    res.send({ message: "Backend is up and running! :)" })
})

routes.use("/locations", locRoutes)

routes.use("/niveis", niveisRoutes)

routes.use("/areas", areasRoutes)

routes.use("/generos", generosRoutes)

routes.use("/referencias", referenciasRoutes)

export { routes };