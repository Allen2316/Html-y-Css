<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

/* $router->group(['middleware' => 'auth'], function () use ($router) { */
    $router->group(["prefix" => "cliente"], function ($router) {
        $router->get("all", "ClienteController@allSinRestricciones");
        $router->get("allJson", "ClienteController@allJson");
        $router->get("get/{cedula}", "ClienteController@getCliente");
        /* $router->post('new', 'ClienteController@create'); */
    });
/* }); */

$router->group(['prefix' => 'usuario'], function ($router) {
    $router->post('ingresar', 'UserController@login');
    $router->post('salir', 'UserController@logout');
});


$router->group(['middleware' => 'auth'], function () use ($router) {
    $router->group(["prefix" => "cliente"], function ($router) {
        $router->post('new', 'ClienteController@create');
    });
});
