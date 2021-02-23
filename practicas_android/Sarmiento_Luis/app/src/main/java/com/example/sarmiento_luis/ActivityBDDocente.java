package com.example.sarmiento_luis;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.example.sarmiento_luis.helper.HelperBDDocente;

public class ActivityBDDocente extends AppCompatActivity implements View.OnClickListener {
    EditText cajaCedula, cajaApellidos, cajaNombres;
    Button btnGuardar, btnModificar, btnEliminar, btnEliminarTodos, btnBuscar, btnBuscarTodos;
    TextView datos;
    HelperBDDocente helper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_b_d_docente);
        cajaCedula = findViewById(R.id.txtCedulaDBHelper);
        cajaApellidos = findViewById(R.id.txtApellidosDBHelper);
        cajaNombres = findViewById(R.id.txtNombresDBHelper);
        btnGuardar = findViewById(R.id.btnGuardarDBHelper);
        btnModificar = findViewById(R.id.btnModificarDBHelper);
        btnEliminar = findViewById(R.id.btnEliminarCedulaDBHelper);
        btnEliminarTodos = findViewById(R.id.btnEliminarTodosDBHelper);
        btnBuscar = findViewById(R.id.btnBuscarCedulaDBHelper);
        btnBuscarTodos = findViewById(R.id.btnBuscarTodosDBHelper);
        datos = findViewById(R.id.lblDatosHelper);

        btnGuardar.setOnClickListener(this);
        btnModificar.setOnClickListener(this);
        btnEliminar.setOnClickListener(this);
        btnEliminarTodos.setOnClickListener(this);
        btnBuscar.setOnClickListener(this);
        btnBuscarTodos.setOnClickListener(this);

        helper = new HelperBDDocente(this, "bda1", null, 1);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btnGuardarDBHelper:
                helper.insertar(cajaCedula.getText().toString(),
                        cajaApellidos.getText().toString(),
                        cajaNombres.getText().toString());
                cajaCedula.setText("");
                cajaApellidos.setText("");
                cajaNombres.setText("");
                break;
            case R.id.btnModificarDBHelper:
                helper.update(cajaCedula.getText().toString(),
                        cajaApellidos.getText().toString(),
                        cajaNombres.getText().toString());
                break;
            case R.id.btnEliminarCedulaDBHelper:
                helper.eliminarCedula(cajaCedula.getText().toString());
                break;
            case R.id.btnEliminarTodosDBHelper:
                datos.setText("");
                helper.eliminarTodos();
                break;
            case R.id.btnBuscarCedulaDBHelper:
                datos.setText("");
                datos.setText(helper.leerCedula(cajaCedula.getText().toString()));
                break;
            case R.id.btnBuscarTodosDBHelper:
                datos.setText(helper.leerTodos());
                break;
        }
    }
}