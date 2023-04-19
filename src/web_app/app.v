module web_app

import vweb
import os

struct App {
    vweb.Context
}

struct Object {
    title       string
    description string
}

pub fn run_web() {
    vweb.run_at(new_app(), vweb.RunParams{
        port: 8081
    }) or { panic(err) }
}

fn new_app() &App {
    mut app := &App{}
    // makes all static files available.
    app.mount_static_folder_at(os.resource_abs_path('.'), '/')
    return app
}

['/']
fn (mut app App) page_home() vweb.Result {
    // all this constants can be accessed by src/templates/page/home.html file.
    page_title := 'V is the new V'
    v_url := 'https://github.com/vlang/v'

    list_of_object := [
        Object{
            title: 'One good title'
            description: 'this is the first'
        },
        Object{
            title: 'Other good title'
            description: 'more one'
        },
    ]
    // $vweb.html() in `<folder>_<name> vweb.Result ()` like this
    // render the `<name>.html` in folder `./templates/<folder>`
    return $vweb.html()
}
