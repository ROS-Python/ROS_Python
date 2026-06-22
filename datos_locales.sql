--
-- PostgreSQL database dump
--

\restrict DKFeMyBWMdK9suksD5ox0ZSYKfNfzbIuiqya5YbTWaQl8KdtA7uKfghoJIYWh8Z

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type VALUES (1, 'users', 'carritoitemmodel');
INSERT INTO public.django_content_type VALUES (2, 'users', 'categoriamodel');
INSERT INTO public.django_content_type VALUES (3, 'users', 'detallepagomodel');
INSERT INTO public.django_content_type VALUES (4, 'users', 'detallepedidomodel');
INSERT INTO public.django_content_type VALUES (5, 'users', 'horariomodel');
INSERT INTO public.django_content_type VALUES (6, 'users', 'inventariomodel');
INSERT INTO public.django_content_type VALUES (7, 'users', 'mesamodel');
INSERT INTO public.django_content_type VALUES (8, 'users', 'noticiamodel');
INSERT INTO public.django_content_type VALUES (9, 'users', 'pagomodel');
INSERT INTO public.django_content_type VALUES (10, 'users', 'pedidomodel');
INSERT INTO public.django_content_type VALUES (11, 'users', 'productomodel');
INSERT INTO public.django_content_type VALUES (12, 'users', 'promocionmodel');
INSERT INTO public.django_content_type VALUES (13, 'users', 'reservamodel');
INSERT INTO public.django_content_type VALUES (14, 'users', 'rolmodel');
INSERT INTO public.django_content_type VALUES (15, 'users', 'user');
INSERT INTO public.django_content_type VALUES (16, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (17, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (18, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (19, 'auth', 'user');
INSERT INTO public.django_content_type VALUES (20, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (21, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (22, 'users', 'insumomodel');
INSERT INTO public.django_content_type VALUES (23, 'users', 'recetaitemmodel');


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission VALUES (1, 'Can add categoria model', 2, 'add_categoriamodel');
INSERT INTO public.auth_permission VALUES (2, 'Can change categoria model', 2, 'change_categoriamodel');
INSERT INTO public.auth_permission VALUES (3, 'Can delete categoria model', 2, 'delete_categoriamodel');
INSERT INTO public.auth_permission VALUES (4, 'Can view categoria model', 2, 'view_categoriamodel');
INSERT INTO public.auth_permission VALUES (5, 'Can add mesa model', 7, 'add_mesamodel');
INSERT INTO public.auth_permission VALUES (6, 'Can change mesa model', 7, 'change_mesamodel');
INSERT INTO public.auth_permission VALUES (7, 'Can delete mesa model', 7, 'delete_mesamodel');
INSERT INTO public.auth_permission VALUES (8, 'Can view mesa model', 7, 'view_mesamodel');
INSERT INTO public.auth_permission VALUES (9, 'Can add noticia model', 8, 'add_noticiamodel');
INSERT INTO public.auth_permission VALUES (10, 'Can change noticia model', 8, 'change_noticiamodel');
INSERT INTO public.auth_permission VALUES (11, 'Can delete noticia model', 8, 'delete_noticiamodel');
INSERT INTO public.auth_permission VALUES (12, 'Can view noticia model', 8, 'view_noticiamodel');
INSERT INTO public.auth_permission VALUES (13, 'Can add pago model', 9, 'add_pagomodel');
INSERT INTO public.auth_permission VALUES (14, 'Can change pago model', 9, 'change_pagomodel');
INSERT INTO public.auth_permission VALUES (15, 'Can delete pago model', 9, 'delete_pagomodel');
INSERT INTO public.auth_permission VALUES (16, 'Can view pago model', 9, 'view_pagomodel');
INSERT INTO public.auth_permission VALUES (17, 'Can add pedido model', 10, 'add_pedidomodel');
INSERT INTO public.auth_permission VALUES (18, 'Can change pedido model', 10, 'change_pedidomodel');
INSERT INTO public.auth_permission VALUES (19, 'Can delete pedido model', 10, 'delete_pedidomodel');
INSERT INTO public.auth_permission VALUES (20, 'Can view pedido model', 10, 'view_pedidomodel');
INSERT INTO public.auth_permission VALUES (21, 'Can add rol model', 14, 'add_rolmodel');
INSERT INTO public.auth_permission VALUES (22, 'Can change rol model', 14, 'change_rolmodel');
INSERT INTO public.auth_permission VALUES (23, 'Can delete rol model', 14, 'delete_rolmodel');
INSERT INTO public.auth_permission VALUES (24, 'Can view rol model', 14, 'view_rolmodel');
INSERT INTO public.auth_permission VALUES (25, 'Can add detalle pago model', 3, 'add_detallepagomodel');
INSERT INTO public.auth_permission VALUES (26, 'Can change detalle pago model', 3, 'change_detallepagomodel');
INSERT INTO public.auth_permission VALUES (27, 'Can delete detalle pago model', 3, 'delete_detallepagomodel');
INSERT INTO public.auth_permission VALUES (28, 'Can view detalle pago model', 3, 'view_detallepagomodel');
INSERT INTO public.auth_permission VALUES (29, 'Can add producto model', 11, 'add_productomodel');
INSERT INTO public.auth_permission VALUES (30, 'Can change producto model', 11, 'change_productomodel');
INSERT INTO public.auth_permission VALUES (31, 'Can delete producto model', 11, 'delete_productomodel');
INSERT INTO public.auth_permission VALUES (32, 'Can view producto model', 11, 'view_productomodel');
INSERT INTO public.auth_permission VALUES (33, 'Can add inventario model', 6, 'add_inventariomodel');
INSERT INTO public.auth_permission VALUES (34, 'Can change inventario model', 6, 'change_inventariomodel');
INSERT INTO public.auth_permission VALUES (35, 'Can delete inventario model', 6, 'delete_inventariomodel');
INSERT INTO public.auth_permission VALUES (36, 'Can view inventario model', 6, 'view_inventariomodel');
INSERT INTO public.auth_permission VALUES (37, 'Can add detalle pedido model', 4, 'add_detallepedidomodel');
INSERT INTO public.auth_permission VALUES (38, 'Can change detalle pedido model', 4, 'change_detallepedidomodel');
INSERT INTO public.auth_permission VALUES (39, 'Can delete detalle pedido model', 4, 'delete_detallepedidomodel');
INSERT INTO public.auth_permission VALUES (40, 'Can view detalle pedido model', 4, 'view_detallepedidomodel');
INSERT INTO public.auth_permission VALUES (41, 'Can add carrito item model', 1, 'add_carritoitemmodel');
INSERT INTO public.auth_permission VALUES (42, 'Can change carrito item model', 1, 'change_carritoitemmodel');
INSERT INTO public.auth_permission VALUES (43, 'Can delete carrito item model', 1, 'delete_carritoitemmodel');
INSERT INTO public.auth_permission VALUES (44, 'Can view carrito item model', 1, 'view_carritoitemmodel');
INSERT INTO public.auth_permission VALUES (45, 'Can add promocion model', 12, 'add_promocionmodel');
INSERT INTO public.auth_permission VALUES (46, 'Can change promocion model', 12, 'change_promocionmodel');
INSERT INTO public.auth_permission VALUES (47, 'Can delete promocion model', 12, 'delete_promocionmodel');
INSERT INTO public.auth_permission VALUES (48, 'Can view promocion model', 12, 'view_promocionmodel');
INSERT INTO public.auth_permission VALUES (49, 'Can add reserva model', 13, 'add_reservamodel');
INSERT INTO public.auth_permission VALUES (50, 'Can change reserva model', 13, 'change_reservamodel');
INSERT INTO public.auth_permission VALUES (51, 'Can delete reserva model', 13, 'delete_reservamodel');
INSERT INTO public.auth_permission VALUES (52, 'Can view reserva model', 13, 'view_reservamodel');
INSERT INTO public.auth_permission VALUES (53, 'Can add user', 15, 'add_user');
INSERT INTO public.auth_permission VALUES (54, 'Can change user', 15, 'change_user');
INSERT INTO public.auth_permission VALUES (55, 'Can delete user', 15, 'delete_user');
INSERT INTO public.auth_permission VALUES (56, 'Can view user', 15, 'view_user');
INSERT INTO public.auth_permission VALUES (57, 'Can add horario model', 5, 'add_horariomodel');
INSERT INTO public.auth_permission VALUES (58, 'Can change horario model', 5, 'change_horariomodel');
INSERT INTO public.auth_permission VALUES (59, 'Can delete horario model', 5, 'delete_horariomodel');
INSERT INTO public.auth_permission VALUES (60, 'Can view horario model', 5, 'view_horariomodel');
INSERT INTO public.auth_permission VALUES (61, 'Can add log entry', 16, 'add_logentry');
INSERT INTO public.auth_permission VALUES (62, 'Can change log entry', 16, 'change_logentry');
INSERT INTO public.auth_permission VALUES (63, 'Can delete log entry', 16, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (64, 'Can view log entry', 16, 'view_logentry');
INSERT INTO public.auth_permission VALUES (65, 'Can add permission', 18, 'add_permission');
INSERT INTO public.auth_permission VALUES (66, 'Can change permission', 18, 'change_permission');
INSERT INTO public.auth_permission VALUES (67, 'Can delete permission', 18, 'delete_permission');
INSERT INTO public.auth_permission VALUES (68, 'Can view permission', 18, 'view_permission');
INSERT INTO public.auth_permission VALUES (69, 'Can add group', 17, 'add_group');
INSERT INTO public.auth_permission VALUES (70, 'Can change group', 17, 'change_group');
INSERT INTO public.auth_permission VALUES (71, 'Can delete group', 17, 'delete_group');
INSERT INTO public.auth_permission VALUES (72, 'Can view group', 17, 'view_group');
INSERT INTO public.auth_permission VALUES (73, 'Can add user', 19, 'add_user');
INSERT INTO public.auth_permission VALUES (74, 'Can change user', 19, 'change_user');
INSERT INTO public.auth_permission VALUES (75, 'Can delete user', 19, 'delete_user');
INSERT INTO public.auth_permission VALUES (76, 'Can view user', 19, 'view_user');
INSERT INTO public.auth_permission VALUES (77, 'Can add content type', 20, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (78, 'Can change content type', 20, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (79, 'Can delete content type', 20, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (80, 'Can view content type', 20, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (81, 'Can add session', 21, 'add_session');
INSERT INTO public.auth_permission VALUES (82, 'Can change session', 21, 'change_session');
INSERT INTO public.auth_permission VALUES (83, 'Can delete session', 21, 'delete_session');
INSERT INTO public.auth_permission VALUES (84, 'Can view session', 21, 'view_session');
INSERT INTO public.auth_permission VALUES (85, 'Can add insumo model', 22, 'add_insumomodel');
INSERT INTO public.auth_permission VALUES (86, 'Can change insumo model', 22, 'change_insumomodel');
INSERT INTO public.auth_permission VALUES (87, 'Can delete insumo model', 22, 'delete_insumomodel');
INSERT INTO public.auth_permission VALUES (88, 'Can view insumo model', 22, 'view_insumomodel');
INSERT INTO public.auth_permission VALUES (89, 'Can add receta item model', 23, 'add_recetaitemmodel');
INSERT INTO public.auth_permission VALUES (90, 'Can change receta item model', 23, 'change_recetaitemmodel');
INSERT INTO public.auth_permission VALUES (91, 'Can delete receta item model', 23, 'delete_recetaitemmodel');
INSERT INTO public.auth_permission VALUES (92, 'Can view receta item model', 23, 'view_recetaitemmodel');


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categorias VALUES (1, 'Bebidas', 'lol', '2026-03-31 11:57:51.019066-05', '2026-03-31 11:57:51.019082-05');


--
-- Data for Name: mesas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mesas VALUES (1, 1, 4, 'Estadio', 'libre', '2026-03-27 00:09:38.084845-05');


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rol VALUES (1, 'CLIENTE');
INSERT INTO public.rol VALUES (2, 'EMPLEADO');
INSERT INTO public.rol VALUES (3, 'ADMIN');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'Oscar', 'Leguizamon', 'oscar14leguizamon@gmail.com', true, '2026-03-26 23:49:13.977577-05', '2026-03-27 01:58:21.845615-05', 2, '2026-03-26 23:49:14.056905-05', false, false, 'pbkdf2_sha256$1200000$m2BIJWUk9M6UW9gWPkyH0n$r0DNKUS1xyRz7jJ+OiJ9v7B6pQM8lJnFQzn5Vr1fYmU=');
INSERT INTO public.users VALUES (2, 'admin', 'God', 'admin@ollaysazon.com', true, '2026-03-26 23:51:19.979385-05', '2026-03-26 23:55:54.529642-05', 3, '2026-03-31 12:07:24.18057-05', false, false, 'pbkdf2_sha256$1200000$s73oU63kPxsn8unXOp0sBN$5LHPJBdB3yHEMWU4n1Can4nMB2mcTGD5qP/FvlJ8b5g=');


--
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reserva VALUES (1, 'RES-828F9046', 'Oscar Leguizamon', 'oscar@gmail.com', '3133357585', '2026-03-30 09:00:00-05', '14:00', 3, 'PENDIENTE', 'Fiesta', '2026-03-27 00:14:08.573056-05', '2026-03-27 00:14:08.573067-05', 1, NULL);


--
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos VALUES (1, 'Macarrones', 'lol', 45000, NULL, '2026-04-01 00:22:01.013409-05', '2026-04-01 00:22:01.013429-05', 1);


--
-- Data for Name: detalle_pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2026-03-23 15:00:31.133836-05');
INSERT INTO public.django_migrations VALUES (2, 'auth', '0001_initial', '2026-03-23 15:00:31.275414-05');
INSERT INTO public.django_migrations VALUES (3, 'admin', '0001_initial', '2026-03-23 15:00:31.318932-05');
INSERT INTO public.django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2026-03-23 15:00:31.32719-05');
INSERT INTO public.django_migrations VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2026-03-23 15:00:31.340732-05');
INSERT INTO public.django_migrations VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2026-03-23 15:00:31.368112-05');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2026-03-23 15:00:31.37748-05');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0003_alter_user_email_max_length', '2026-03-23 15:00:31.393778-05');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0004_alter_user_username_opts', '2026-03-23 15:00:31.407619-05');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0005_alter_user_last_login_null', '2026-03-23 15:00:31.421544-05');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0006_require_contenttypes_0002', '2026-03-23 15:00:31.423416-05');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2026-03-23 15:00:31.434619-05');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0008_alter_user_username_max_length', '2026-03-23 15:00:31.459342-05');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2026-03-23 15:00:31.47473-05');
INSERT INTO public.django_migrations VALUES (15, 'auth', '0010_alter_group_name_max_length', '2026-03-23 15:00:31.492197-05');
INSERT INTO public.django_migrations VALUES (16, 'auth', '0011_update_proxy_permissions', '2026-03-23 15:00:31.502007-05');
INSERT INTO public.django_migrations VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2026-03-23 15:00:31.512535-05');
INSERT INTO public.django_migrations VALUES (18, 'sessions', '0001_initial', '2026-03-23 15:00:31.532388-05');
INSERT INTO public.django_migrations VALUES (19, 'users', '0001_initial', '2026-03-23 15:00:31.913353-05');
INSERT INTO public.django_migrations VALUES (20, 'users', '0002_user_abstractbaseuser', '2026-03-25 12:13:29.251461-05');
INSERT INTO public.django_migrations VALUES (21, 'users', '0003_insumos_recetas', '2026-03-31 11:56:23.715899-05');
INSERT INTO public.django_migrations VALUES (22, 'users', '0004_eliminar_carrito_item_detalle_pago', '2026-03-31 11:56:23.884629-05');
INSERT INTO public.django_migrations VALUES (23, 'users', '0005_agregar_codigo_pedido', '2026-03-31 11:56:23.950932-05');


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_session VALUES ('65ortsqtap422uhgboujc5bgx1dk1l91', 'eyJfcGFzc3dvcmRfcmVzZXRfdG9rZW4iOiJkNjJyYWctZDNhZjU1NDlhMWUzZmNhNDBmMzM2M2E3Y2IyMTI0YzcifQ:1w60Q3:FgAPq4Sv7suO-KG7ZIlcZH3kSFo9AmgAwFoE1qJf9IA', '2026-04-10 01:11:43.532122-05');
INSERT INTO public.django_session VALUES ('19nd4qiv3cg4aiost31mmeocj53ximof', 'e30:1w619B:rLp1_aqnxPoVu4mMSub4XEqfdlnHAm0qK-Puey3JiDw', '2026-04-10 01:58:21.869771-05');
INSERT INTO public.django_session VALUES ('etlnkiki856i6l92544jiz7wwsm44znq', '.eJxVjDsOwjAQBe_iGln-rPyhpOcMlte7wQFkS3FSIe4OkVJA-2bmvUTK21rTNnhJM4mzMOL0u2EuD247oHtuty5Lb-syo9wVedAhr534eTncv4OaR_3WwKgpQDCaABQVFyPSpDE6BLAUEJ0ntj4qmBRAMRaNYlTG2ByDZ_H-AOG5N54:1w7cOp:YtlGpPrc7IixBRyR1vEPRLwihpaqHIE9NPlMWEXUdyM', '2026-04-14 11:57:07.607388-05');
INSERT INTO public.django_session VALUES ('o4m2rl0poksiwdys1upkaip25den2vji', '.eJxVjDsOwjAQBe_iGln-rPyhpOcMlte7wQFkS3FSIe4OkVJA-2bmvUTK21rTNnhJM4mzMOL0u2EuD247oHtuty5Lb-syo9wVedAhr534eTncv4OaR_3WwKgpQDCaABQVFyPSpDE6BLAUEJ0ntj4qmBRAMRaNYlTG2ByDZ_H-AOG5N54:1w7cYm:tlqJpCwkFCy1wSwc1ghX-F9H_zpZWKVuYs_SjcDwXNo', '2026-04-14 12:07:24.191055-05');


--
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: insumos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: inventarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: noticias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.noticias VALUES (1, 'Bienvenido Nuevas Ofertas', 'La escena gastronómica en Bogotá evoluciona con la llegada de nuevas experiencias como el enfoque en comida callejera vietnamita de Danny Boi y la expansión de Andrés Carne de Res a Cenco Limonar. Además, técnicas de vanguardia se destacan con ingredientes locales en Lobo Negro en La Macarena. La tendencia ''omakase'' gana terreno en la ciudad.', '/media/noticias/438986fcb74643ceaa808b8436abb219.jpg', '2026-03-30', '2026-03-27 00:11:39.484965-05');


--
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: promociones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.promociones VALUES (1, 'Comida Especial', 'lol aprovecha', '/media/promociones/3f051eeaf727436d961083e06e06c92b.jpg', 20, '2026-03-30', '2026-03-31', '2026-03-27 00:03:55.897793-05', '2026-03-27 00:03:55.897806-05');


--
-- Data for Name: promocion_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: receta_items; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 92, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: categorias_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 1, true);


--
-- Name: detalle_pedidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_pedidos_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 23, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: horarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horarios_id_seq', 1, false);


--
-- Name: insumos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insumos_id_seq', 1, false);


--
-- Name: inventarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventarios_id_seq', 1, false);


--
-- Name: mesas_id_mesa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mesas_id_mesa_seq', 1, true);


--
-- Name: noticias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.noticias_id_seq', 1, true);


--
-- Name: pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagos_id_seq', 1, false);


--
-- Name: pedidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_id_seq', 1, false);


--
-- Name: productos_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_producto_seq', 1, true);


--
-- Name: promocion_productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promocion_productos_id_seq', 1, false);


--
-- Name: promociones_id_promocion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promociones_id_promocion_seq', 1, true);


--
-- Name: receta_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receta_items_id_seq', 1, false);


--
-- Name: reserva_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reserva_id_seq', 1, true);


--
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_id_rol_seq', 3, true);


--
-- Name: users_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_groups_id_seq', 1, false);


--
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_user_seq', 3, true);


--
-- Name: users_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_permissions_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict DKFeMyBWMdK9suksD5ox0ZSYKfNfzbIuiqya5YbTWaQl8KdtA7uKfghoJIYWh8Z

