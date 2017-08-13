"use strict";
import api from "./api";

class DashboardApi {

    /**
     * {
     *  date:,
     *  search
     * }
     */
    getTransactions()
    {
        api.get("index.php?r=site/transactions", function (res) {
            console.log(res);
            if (res.success) {
                console.log(res.data);
            }
        })
            .fail(function (res) {
                console.log(res);
            });
    }
}

export default DashboardApi;
