"""SMM AI Department module."""
from .routes import router, register_dependencies


def register_smm_routes(app, load_modules_fn, start_module_fn, stop_module_fn):
    """Register all SMM routes with the FastAPI app."""
    register_dependencies(load_modules_fn, start_module_fn, stop_module_fn)
    app.include_router(router)
