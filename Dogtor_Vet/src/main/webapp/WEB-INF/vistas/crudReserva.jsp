<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<jsp:include page="validarSesion.jsp" />
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Expires" content="-1" />
	<meta http-equiv="Cache-Control" content="private" />
	<meta http-equiv="Cache-Control" content="no-store" />
	<meta http-equiv="Pragma" content="no-cache" />
	<link rel="stylesheet" href="css/bootstrapValidator.css" />
	<link rel="stylesheet" href="css/dashboard.css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	<!-- Menu y Header requieren jQuery al inicio -->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<title>Reserva | Dogtor</title>
</head>

<body class="background__light__gray">
	<main id="dashboard">
		<div class="container-fluid align-items-stretch">
			<!-- Header on XS, SM, and MD -->
			<jsp:include page="header.jsp" />
			
			<div class="row">
				<!-- Menu on LG and XXL --> <jsp:include page="menu.jsp" />
				<c:if test="${requestScope.MENSAJE != null}">
					<div class="alert alert-danger fade in" id="success-alert">
						<a href="#" class="close" data-dismiss="alert">&times;</a>
						<strong>${requestScope.MENSAJE}</strong>
					</div>
				</c:if>
				
				<!-- Dashboard Content -->
				<div id="dashboardContent" class="col-12 col-md-10 dashboard__content mt-lg-1 mt-5 menu__transition mx-auto">
					<div class="content__body background__light__white menu__transition">
						<div class="row justify-content-center">
							<div class="content__body__title col-4">
								<p class="font__title title__color font__semibold">Nueva Reserva de Cita</p>
							</div>
							<div class="content__body__options col-8 d-flex flex-row justify-content-end align-items-top">
								<div id="btnMessage" class="options__message d-flex align-items-center d-none d-lg-flex mx-2"><i data-feather="message-square"></i></div>
								<div id="btnProfile" class="options__profile mx-2">
									<img src="./images/avatar/random-1.svg" alt="Avatar" class="profile__image">
								</div>
							</div>
							
							<div class="content__alert row">
								<div class="col-12 mt-4 mb-2">
									<form id="id_form_registra">
										<div class="card__light">
											<div class="card__light__header d-flex justify-content-between my-3">
												<p class="font__subtitle title__color font__semibold">Informaci�n de Propietario</p>
											</div>
											<div class="card__light__body row">
												<div class="form-group row align-items-center mx-auto">
													<div class="col-12 col-md-3 mb-3">
														<div class="form-floating"><input type="text" name="codigo_propietario" class="form-control" id="id_codigo_propietario" readonly>
															<label for="id_codigo_propietario">C�digo</label>
														</div>
													</div>
													<div class="col-12 col-md-9 mb-3">
														<div class="form-floating"><input type="text" name="email_usuario" class="form-control" id="id_email_propietario" readonly>
															<label for="id_email_propietario">Email de Propietario</label>
														</div>
													</div>
												</div>
												<div class="form-group row align-items-center mx-auto">
													<div class="col-12 col-md-4 mb-3">
														<div class="form-floating"><input type="text" name="nombre_usuario" class="form-control" id="id_nombre_propietario" readonly>
															<label for="id_nombre_propietario">Nombre de Propietario</label>
														</div>
													</div>
													<div class="col-12 col-md-4 mb-3">
														<div class="form-floating">
															<input type="text" name="apellido_usuario" class="form-control" id="id_apellido_propietario" readonly>
															<label for="id_apellido_propietario">Apellido de Propietario</label>
														</div>
													</div>
													<div class="col-12 col-md-4 mb-3">
														<div class="row align-itmes-center mx-auto">
															<button class="btn btn__primary" type="button" data-toggle="modal" id="id_btnModal_BuscarCliente" data-target="#id_modal_BuscarCliente"><i data-feather="search"></i>Buscar Cliente</button>
														</div>
													</div>
												</div>
												<div class="form-group row align-items-center mx-auto">
													<div class="col-12 col-md-3 mb-3">
														<div class="form-floating"><input type="text" name="codigo_mascota" class="form-control" id="id_codigo_mascota" readonly>
															<label for="id_codigo_mascota">C�digo</label>
														</div>
													</div>
													<div class="col-12 col-md-6 mb-3">
														<div class="form-floating"><input type="text" name="nombre_mascota" class="form-control" id="id_nombre_mascota" readonly>
															<label for="id_nombre_mascota">Nombre de Mascota</label>
														</div>
													</div>
													<div class="col-12 col-md-3 mb-3">
														<div class="row align-items-center mx-auto">
															<button class="btn btn__primary" type="button" data-toggle="modal" id="id_btnModal_BuscarMascota" data-target="#id_modal_BuscarMascota"><i data-feather="search"></i>Buscar mascota</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<div class="container-fluid">
		<!-- Modal de B�squeda de Clientes -->
		<div class="modal fade p-0" id="id_modal_BuscarCliente">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<div class="col-12 justify-content-center align-items-center d-flex">
							<h1 class="h3 mb-2 mt-2 fw-normal text-center"><b>Buscar Propietarios</b></h1>
						</div>
					</div>
					
					<div class="modal-body">
						<div class="container">
							<div class="row mt-2">
								<div class="col-12 justify-content-center align-items-center d-flex">
									<main class="col-12 col-md-10">
										<form id="id_form_buscaCliente">
											<div class="form-group row justify-content-center align-items-center mx-auto">
												<div class="col-9 mb-3">
													<div class="form-floating"><input type="text" id="id_cliente_filtro" name="filtro_nombre_usuario" class="form-control">
														<label for="id_cliente_filtro">Nombre de Propietario</label>
													</div>
												</div>
												<div class="col-3 mb-3">
													<button class="btn btn-primary" type="button" id="filtra_cliente"><i data-feather="search"></i>Buscar</button>
												</div>
											</div>
											<div class="row justify-content-center align-items-center mx-auto">
												<div class="col-12 table-responsive">
													<table id="id_table_propietario" class="font__min display responsive no-footer text-center table table-borderless dataTable">
														<thead class="background__title">
															<tr>
																<th>#</th>
																<th>Nombre</th>
																<th>Email</th>
																<th>Acci�n</th>
															</tr>
														</thead>
														<tbody></tbody>
													</table>
												</div>
											</div>
										</form>
									</main>
								</div>
							</div>
						</div>
					</div>
						
					<div class="modal-footer justify-content-between align-items-center">
						<button class="btn btn-primary" type="button" id="id_btnModal_RegistrarCliente"><i data-feather="plus"></i>Nuevo Cliente</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
			
		<!-- Modal de Registro de Clientes -->
		<div class="modal fade p-0" id="id_modal_RegistrarCliente">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<div class="col-12 justify-content-center align-items-center d-flex">
							<h1 class="h3 mb-2 mt-2 fw-normal text-center"><b>Registrar Cliente</b></h1>
						</div>
					</div>
					
					<div class="modal-body">
						<div class="container">
							<div class="row mt-2">
								<div class="col-12 justify-content-center align-items-center d-flex">
									<main class="col-12 col-md-10">
										<form id="id_form_registraCliente">
											<div class="form-group row justify-content-center align-items-center mx-auto">
											
												<div class="col-12 col-md-6 mb-3">
													<div class="form-floating">
														<input type="text" id="id_email_cliente" name="email_usuario" class="form-control">
														<label for="id_email_cliente">Email</label>
													</div>
												</div>
												<div class="col-12 col-md-6 mb-3">
													<div class="form-floating"><input type="date" id="id_fecha_cliente" name="fecha_nacimiento_usuario" class="form-control">
														<label for="id_fecha_cliente">Fecha nacimiento</label>
													</div>
												</div>
											</div>
											
											<div class="form-group row justify-content-center align-items-center mx-auto">
												<div class="col-12 col-md-6 mb-3">
													<div class="form-floating"><input type="text" id="id_nombre_cliente" name="nombre_usuario" class="form-control">
														<label for="id_nombre_cliente">Nombre</label>
													</div>
												</div>
												<div class="col-12 col-md-6 mb-3">
													<div class="form-floating"><input type="text" id="id_apellido_cliente" name="apellido_usuario" class="form-control">
														<label for="id_apellido_cliente">Apellido</label>
													</div>
												</div>
											</div>
											
											<div class="form-group row justify-content-center align-items-center mx-auto">
												<div class="col-12 col-md-4 mb-3">
													<div class="form-floating"><input type="text" id="id_dni_cliente" name="dni_usuario" class="form-control">
														<label for="id_dni_cliente">DNI</label>
													</div>
												</div>
												<div class="col-12 col-md-8 mb-3">
													<div class="form-floating">
														<select class="form-select" id="select_distrito_cliente" name="codigo_distrito" aria-label="Default select example">
															<option selected value="0">Seleccione Distrito</option>
														</select>
														<label for="select_distrito_cliente">Distrito</label>
													</div>
												</div>
											</div>
											
											<div class="form-group row justify-content-center align-items-center mx-auto">
												<div class="col-12 col-md-6 mb-3">
													<div class="form-floating"><input type="text" id="id_direccion_cliente" name="direccion_usuario" class="form-control">
														<label for="id_direccion_cliente">Direcci�n</label>
													</div>
												</div>
												<div class="col-12 col-md-6 mb-3">
													<div class="form-floating"><input type=text id="id_referencia_cliente" name="referencia_usuario" class="form-control">
														<label for="id_referencia_cliente">Referencia</label>
													</div>
												</div>
											</div>
											
											<div class="form-group row justify-content-center align-items-center mx-auto">
												<div class="form-floating text-center">
													<button class="btn btn__primary" type="button" id="registra_mascota">Registrar</button>
												</div>
											</div>
										</form>
									</main>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
			
		<!-- Modal de B�squeda de Mascotas -->
		<div class="modal fade p-0" id="id_modal_BuscarMascota">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<div class="col-12 justify-content-center align-items-center d-flex">
							<h1 class="h3 mb-2 mt-2 fw-normal text-center"><b>Buscar Mascotas</b></h1>
						</div>
					</div>
					
					<div class="modal-body">
						<div class="container">
							<div class="row mt-2">
								<div class="col-12 justify-content-center align-items-center d-flex">
									<main class="col-12 col-md-10">
										<form id="id_form_buscaMascota">
											<div class="form-group row justify-content-center align-items-center mx-auto">
												<div class="col-9 mb-3">
													<div class="form-floating"><input type="text" id="id_mascota_filtro" name="filtro_nombre_mascota" class="form-control">
														<label for="id_mascota_filtro">Nombre de Mascota</label>
													</div>
												</div>
												<div class="col-3 mb-3">
													<button class="btn btn-primary" type="button" id="filtra_mascota"><i data-feather="search"></i>Buscar</button>
												</div>
											</div>
											
											<div class="row justify-content-center align-items-center mx-auto">
												<div class="col-12 table-responsive">
													<table id="id_table_mascota" class="font__min display responsive no-footer text-center table table-borderless dataTable">
														<thead class="background__title">
															<tr>
																<th>#</th>
																<th>Nombre</th>
																<th>Fecha</th>
																<th>Acci�n</th>
															</tr>
														</thead>
														<tbody></tbody>
													</table>
												</div>
											</div>
										</form>
									</main>
								</div>
							</div>
						</div>
					</div>
					
					<div class="modal-footer justify-content-between align-items-center">
						<button class="btn btn-primary" type="button" id="id_btnModal_RegistrarMascota"><i data-feather="plus"></i>Nueva Mascota</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
			
		<!-- Modal de Registro de Mascotas -->
		<div class="modal fade p-0" id="id_modal_RegistrarMascota">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<div class="col-12 justify-content-center align-items-center d-flex">
							<h1 class="h3 mb-2 mt-2 fw-normal text-center">
								<b>Registrar Mascota</b>
							</h1>
						</div>
					</div>
					
					<div class="modal-body">
						<div class="container">
							<div class="row mt-2">
								<div class="col-12 justify-content-center align-items-center d-flex">
									<main class="col-12 col-md-10">
										<form id="id_form_registraMascota">
										
											<div class="form-group row justify-content-center align-items-center mx-auto">
												<div class="col-12 col-md-6 mb-3">
													<div class="form-floating"><input type="text" id="id_nombre_mascota" name="nombre_mascota" class="form-control">
														<label for="id_nombre_mascota">Nombre de Mascota</label>
													</div>
												</div>
												<div class="col-12 col-md-6 mb-3">
													<div class="form-floating"><input type="date" id="id_fecha_mascota" name="fecha_nacimiento_mascota" class="form-control">
														<label for="id_fecha_mascota">Fecha de nacimiento</label>
													</div>
												</div>
											</div>
											
											<div class="form-group row justify-content-center align-items-center mx-auto">
												<div class="col-12 col-md-6 mb-3">
													<div class="form-floating">
														<select class="form-select" id="select_especie" name="codigo_especie_mascota" aria-label="Select">
															<option selected value="0">Seleccione Especie</option>
														</select>
														<label for="select_especie">Especie</label>
													</div>
												</div>
												<div class="col-12 col-md-6 mb-3">
													<div class="form-floating">
														<select class="form-select" id="select_raza" name="codigo_raza_mascota" aria-label="Select">
															<option selected value="0">Seleccione Raza</option>
														</select>
														<label for="select_raza">Raza</label>
													</div>
												</div>
											</div>
											
											<div class="form-group row justify-content-center align-items-center mx-auto">
												<div class="col-12 col-md-6 mb-3">
													<div class="form-floating">
														<select class="form-select" id="select_color" name="codigo_color_mascota" aria-label="Select">
															<option selected value="0">Seleccione Color</option>
														</select>
														<label for="select_color">Color</label>
													</div>
												</div>
												<div class="col-12 col-md-6 mb-3">
													<div class="form-floating">
														<select class="form-select" id="select_sexo" name="codigo_sexo_mascota" aria-label="Select">
															<option selected value="0">Seleccione Sexo</option>
														</select>
														<label for="select_sexo">Sexo</label>
													</div>
												</div>
											</div>
											
											<div class="form-group row justify-content-center align-items-center mx-auto">
												<div class="form-floating text-center">
													<button class="btn btn-primary" type="button" id="registra_mascota">Registrar</button>
												</div>
											</div>
										</form>
									</main>
								</div>
							</div>
						</div>
					</div>
				
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
	<!-- Custom JS -->
	<script type="text/javascript" src="js/global.js"></script>
	<script type="text/javascript" src="js/createNewErrorMessage.js"></script>
	<script type="text/javascript" src="js/menuDashboard.js"></script>
	
	<script type="text/javascript">
	
        // Load icons
        feather.replace();

        function agregarGrillaPropietarios(lista) {
            $('#id_table_propietario').DataTable().clear();
            $('#id_table_propietario').DataTable().destroy();
            $('#id_table_propietario').DataTable({
                 data : lista,
                 searching : false,
                 ordering : true,
                 processing : true,
                 pageLength : 6,
                 lengthChange : false,
                 responsive : true,
                 columns : 
					[
	                    {
	                        data : "codigo_usuario"
	                    },
	                    {
	                        data : function (row, type, val, meta) {
	                            let cliente = '';
	                            cliente = row.nombre_usuario + ' ' + row.apellido_usuario;
	                            return cliente;
	                        },className : 'text-center mx-auto'
	                    },
	                    {
	                        data : "email_usuario"
	                    },
	                    {
	                        data : function (row, type, val, meta) {
	                            var btnSeleccionar = '<button type="button" class="btn btn__clean btn-sm" onclick="seleccionarPropietario(\''
	                                    + row.codigo_usuario
	                                    + '\',\''
	                                    + row.nombre_usuario
	                                    + '\',\''
	                                    + row.apellido_usuario
	                                    + '\',\''
	                                    + row.email_usuario
	                                    + '\')"><i data-feather="user-check"></i></button>';
	                            return btnSeleccionar
	                        },className : 'text-center mx-auto'
	                    },
					]
              });

            // Reload icons
            feather.replace();

            $('#id_table_propietario').DataTable().columns.adjust().draw();
        }

        function agregarGrillaMascotas(lista) {
            $('#id_table_mascota').DataTable().clear();
            $('#id_table_mascota').DataTable().destroy();
            $('#id_table_mascota').DataTable(
                   {
                       data : lista,
                       searching : false,
                       ordering : true,
                       processing : true,
                       pageLength : 6,
                       lengthChange : false,
                       responsive : true,
                       columns : 
                           [
		                        {
		                            data : "codigo_mascota"
		                        },
		                        {
		                            data : "nombre_mascota"
		                        },
		                        {
		                            data : "fecha_nacimiento_mascota"
		                        },
		                        {
		                            data : function (row, type, val, meta) {
		                                var btnSeleccionar = '<button type="button" class="btn btn__clean btn-sm" onclick="seleccionarMascota(\''
		                                        + row.codigo_mascota
		                                        + '\',\''
		                                        + row.nombre_mascota
		                                        + '\',\''
		                                        + row.fecha_nacimiento_mascota
		                                        + '\')"><i data-feather="user-check"></i></button>';
		                                return btnSeleccionar
		                       },className : 'text-center mx-auto'},
						]
                   });

            // Reload icons
            feather.replace();

            $('#id_table_mascota').DataTable().columns.adjust().draw();
        }

        function listarUsuarioPorNombre(nombre) {
            $.getJSON("listaUsuarioPorNombre", {"nombre_usuario" : nombre}, function (lista) {
                agregarGrillaPropietarios(lista);
            });
        }

        function listarMascotaPorPropietarioYNombre(propietario, nombre) {
            $.getJSON("listaMascotaPorPropietarioYNombre", {"codigo_propietario" : propietario,"nombre_mascota" : nombre}, function (lista) {
                agregarGrillaMascotas(lista);
            });
        }

        function seleccionarPropietario(codigo, nombre, apellido, email) {
            $('#id_codigo_propietario').val(codigo)
            $('#id_nombre_propietario').val(nombre)
            $('#id_apellido_propietario').val(apellido)
            $('#id_email_propietario').val(email)
            $('#id_modal_BuscarCliente').modal("hide");
        }

        function seleccionarMascota(codigo, nombre, fecha) {

        }

        $(document).ready(function () {
	
	        /*const btnRegister = $('#registrar_cita');
	        const btnModalRegister = $('#id_btnModal_RegistraCita');
	        const modalRegister = $('#id_modal_RegistraCita');*/
	
	        // Propietarios (Usuario con Rol Cliente)
	        const btnMostrarBuscarCliente = $('#id_btnModal_BuscarCliente');
	        const modalBuscarCliente = $('#id_modal_BuscarCliente');
	
	        btnMostrarBuscarCliente.click(function () {
	            modalBuscarCliente.modal("show");
	        });
	
	        const btnFilterCliente = $('#filtra_cliente');
	
	        btnFilterCliente.click(function () {
	            var nombre = $('#id_cliente_filtro').val();
	            listarUsuarioPorNombre(nombre);
	        });
	
	        const btnMostrarRegistrarCliente = $('#id_btnModal_RegistrarCliente');
	        const modalRegistrarCliente = $('#id_modal_RegistrarCliente');
	
	        btnMostrarRegistrarCliente.click(function () {
	            modalBuscarCliente.modal("hide");
	            modalRegistrarCliente.modal("show");
	        });
	
	        // Mascotas
	        const btnMostrarBuscarMascota = $('#id_btnModal_BuscarMascota');
	        const modalBuscarMascota = $('#id_modal_BuscarMascota');
	
	        btnMostrarBuscarMascota.click(function () {
	            modalBuscarMascota.modal("show");
	        });
	
	        const btnFilterMascota = $('#filtra_mascota');
	
	        btnFilterMascota.click(function () {
	            var propietario = $('#id_codigo_propietario')
	                    .val();
	            var nombre = $('#id_mascota_filtro').val();
	
	            if (propietario.length > 0) {
	                listarMascotaPorPropietarioYNombre(propietario, nombre);
	            }
	        });
	
	        const btnMostrarRegistrarMascota = $('#id_btnModal_RegistrarMascota');
	        const modalRegistrarMascota = $('#id_modal_RegistrarMascota');
	
	        btnMostrarRegistrarMascota.click(function () {
	            modalBuscarMascota.modal("hide");
	            modalRegistrarMascota.modal("show");
	        });

	    });
    </script>
</body>
</html>