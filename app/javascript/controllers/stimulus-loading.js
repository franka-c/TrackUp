// app/javascript/controllers/stimulus-loading.js

export function eagerLoadControllersFrom(glob, application) {
    console.log("Eager loading controllers from:", glob)
    const controllerFiles = import.meta.glob(`${glob}/**/*_controller.js`, { eager: true })
    for (const path in controllerFiles) {
        const controllerModule = controllerFiles[path]
        const identifier = path
            .replace(/^.*controllers\//, "")
            .replace(/_controller\.js$/, "")
            .replace(/\//g, "--")
        console.log(`Registering controller: ${identifier} from ${path}`)
        application.register(identifier, controllerModule.default)
    }
}
