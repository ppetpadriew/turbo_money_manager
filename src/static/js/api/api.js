"use strict";
import $ from "jquery";

class Api {
    get(url, callback)
    {
        return $.get(url, callback, 'json');
    }
}
var api = new Api();
export default api;

