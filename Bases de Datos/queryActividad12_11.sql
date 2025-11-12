drop database if exists clinica;
create database clinica;
use clinica;

create table if not exists medico(
idMedico int primary key not null,
nombreCompletoM varchar(30),
nroCategoria varchar(10),
telefono int,
emailM varchar(40),
idEspecialidad int,
nombreEspecialidad varchar(20)
);

create table if not exists pacientes(
idPaciente int primary key not null,
nombreCompletoP varchar(30),
DNI varchar(40),
fechaNacimiento date,
sexo enum("M","F","X"),
direccion varchar(40),
telefono int,
emailP varchar(40)
);

create table if not exists medicamentos(
idMedicamento int primary key not null,
nombreComercial varchar(30),
principiActivo varchar(50),
presentacion varchar(40),
viaAdministracion varchar(30),
diagnosticosAsociados varchar(100)
);

create table if not exists citaMedica(
idCita int primary key not null,
fechaHoraC datetime,
motivoC varchar(200),
estado enum('programada','atendida','cancelada'),
idPaciente int,/*FK*/
foreign key (idPaciente) references pacientes(idPaciente),
idMedico int,/*FK*/
foreign key (idMedico) references medico(idMedico)
);

create table if not exists receta(
idReceta int primary key not null,
idCita int, /*FK*/
fechaR date, 
observacionesR text,
foreign key (idCita) references citaMedica(idCita)
);

create table if not exists recetaDetalle(
idRecetaDetalle int primary key not null,
dosis varchar(60) not null,
frecuencia varchar(60) not null,
duracionDias int not null,
instrucciones text,
idReceta int,
foreign key (idReceta) references receta(idReceta),
idMedicamento int,
foreign key (idMedicamento) references medicamentos(idMedicamento)
);

insert into medico (idMedico, nombreCompletoM, nroCategoria, telefono, emailM, idEspecialidad, nombreEspecialidad) VALUES
(1001, 'Dra. Laura Méndez', 'CAT-1001', '600111222', 'laura.mendez@saludtotal.com', 1, 'Medicina General'),
(1002, 'Dr. Andrés Pardo', 'CAT-1002', '600222333', 'andres.pardo@saludtotal.com', 3, 'Cardiología'),
(1003, 'Dra. Silvia Ríos', 'CAT-1003', '600333444', 'silvia.rios@saludtotal.com', 4, 'Dermatología'),
(1004, 'Dr. Miguel Torres', 'CAT-1004', '600444555', 'miguel.torres@saludtotal.com', 5, 'Neumología'),
(1005, 'Dra. Paula Gómez', 'CAT-1005', '600555666', 'paula.gomez@saludtotal.com', 2, 'Pediatría');

insert into pacientes (idPaciente, nombreCompletoP, DNI, fechaNacimiento, sexo, direccion, telefono, emailP ) VALUES
(3001, 'Simón Pedro', 'DNI-9101', '1980-02-15', 'M', 'C/ Galilea 10, Madrid', '610111001', 'simon.pedro@email.com'),
(3002, 'Andrés de Betsaida', 'DNI-9102', '1983-07-09', 'M', 'Av. Norte 45, Madrid', '610111002', 'andres.betsaida@email.com'),
(3003, 'Santiago el Mayor', 'DNI-9103', '1978-05-22', 'M', 'C/ Río 4, Madrid', '610111003', 'santiago.mayor@email.com'),
(3004, 'Juan de Zebedeo', 'DNI-9104', '1985-09-11', 'M', 'C/ Lago Azul 7, Madrid', '610111004', 'juan.zebedeo@email.com'),
(3005, 'Felipe de Betsaida', 'DNI-9105', '1990-03-27', 'M', 'C/ Prado 12, Madrid', '610111005', 'felipe.betsaida@email.com'),
(3006, 'Bartolomé Natanael', 'DNI-9106', '1982-10-05', 'M', 'C/ Monte Olivo 9, Madrid', '610111006', 'bartolome.natanael@email.com'),
(3007, 'Tomás Dídimo', 'DNI-9107', '1986-06-20', 'M', 'Av. Sur 8, Madrid', '610111007', 'tomas.didimo@email.com'),
(3008, 'Mateo Leví', 'DNI-9108', '1975-01-30', 'M', 'C/ Templo 3, Madrid', '610111008', 'mateo.levi@email.com'),
(3009, 'Santiago el Menor', 'DNI-9109', '1992-12-15', 'M', 'C/ Pescadores 6, Madrid', '610111009', 'santiago.menor@email.com'),
(3010, 'Judas Tadeo', 'DNI-9110', '1988-11-08', 'M', 'C/ Cedros 14, Madrid', '610111010', 'judas.tadeo@email.com'),
(3011, 'Simón el Zelote', 'DNI-9111', '1979-04-19', 'M', 'C/ Jardín 1, Madrid', '610111011', 'simon.zelote@email.com'),
(3012, 'Judas Iscariote', 'DNI-9112', '1984-08-25', 'M', 'C/ Mercado 22, Madrid', '610111012', 'judas.iscariote@email.com');

insert into medicamentos (idMedicamento, nombreComercial, principiActivo , presentacion, viaAdministracion, diagnosticosAsociados) VALUES
(7001, 'Paracetamol 500', 'Paracetamol', '500 mg comprimidos', 'Oral',"Faringoamigdalitis (1), Lumbalgia (10)"),
(7002, 'Amoxicilina 875/125', 'Amoxicilina / Ácido clavulánico', '875/125 mg comprimidos', 'Oral', "Faringoamigdalitis (1), Otitis media (9)"),
(7003, 'Loratadina 10', 'Loratadina', '10 mg comprimidos', 'Oral',"Rinitis alérgica (2)"),
(7004, 'Salbutamol Inhalador', 'Salbutamol', '100 mcg/dosis inhalador', 'Inhalatoria',"Crisis asmática (3)"),
(7005, 'Betametasona Crema', 'Betametasona', '0.05% crema 30 g', 'Tópica',"Dermatitis de contacto (4)"),
(7006, 'Omeprazol 20', 'Omeprazol', '20 mg cápsulas', 'Oral',"Dispepsia funcional (5)"),
(7007, 'Losartán 50', 'Losartán', '50 mg comprimidos', 'Oral',"Hipertensión arterial (6)"),
(7008, 'Hidroclorotiazida 25', 'Hidroclorotiazida', '25 mg comprimidos', 'Oral',"Hipertensión arterial (6)"),
(7009, 'Clotrimazol Crema', 'Clotrimazol', '1% crema 20 g', 'Tópica',"Tinea pedis (7)"),
(70010, 'Salbutamol Jarabe', 'Salbutamol', '2 mg/5ml jarabe 120 ml', 'Oral',"Infección respiratoria alta (8), Crisis asmática (3)"),
(70011, 'Ibuprofeno 400', 'Ibuprofeno', '400 mg comprimidos', 'Oral',"Lumbalgia (10), Faringoamigdalitis (1) "),
(70012, 'Ácido Acetilsalicílico 100', 'AAS', '100 mg comprimidos', 'Oral',"Hipertensión (profilaxis), pacientes mayores"),
(70013, 'Mupirocina Ungüento', 'Mupirocina', '2% ungüento 15 g', 'Tópica',"Dermatitis infectada, heridas menores"),
(70014, 'Cetirizina 10', 'Cetirizina', '10 mg comprimidos', 'Oral',"Rinitis alérgica (2), Dermatitis alérgica"),
(70015, 'Diazepam 5', 'Diazepam', '5 mg comprimidos', 'Oral',"Lumbalgia con contractura muscular (10)");

insert into citaMedica (idCita, fechaHoraC, motivoC, estado, idPaciente,idMedico) value 
(1,'2025-11-06 09:30',"Dolor de garganta, fiebre leve y malestar general.",'atendida',3001,1001),
(2,'2025-11-06 11:00',"Irritación cutánea en brazos tras usar detergente nuevo.",'atendida',3002,1003),
(3,'2025-11-06 15:00',"Dificultad respiratoria y tos nocturna.",'atendida',3004,1004),
(4,'2025-11-07 10:00',"Dolor abdominal poscomida, ardor estomacal.",'atendida',3005,1001),
(5,'2025-11-08 09:00',"Control de presión arterial; refiere cefalea leve.",'atendida',3003,1002),
(6,'2025-11-08 11:30',"Lesión descamativa entre los dedos del pie derecho.",'atendida',3003,1003),
(7,'2025-11-09 16:00',"Dolor de oído derecho, congestión nasal.",'atendida',3008,1005),
(8,'2025-11-10 09:00',"Tos seca y malestar general sin fiebre alta.",'atendida',3007,1004),
(9,'2025-11-10 12:00',"Dolor lumbar leve y mareos esporádicos.",'atendida',3001,1002),
(10,'2025-11-11 08:30',"Congestión nasal y estornudos frecuentes.",'atendida',3009,1001),
(11,'2025-11-11 11:00',"Revisión de tratamiento antihipertensivo.",'atendida',3005,1002),
(12,'2025-11-12 15:00',"Lesión en antebrazo con costra y enrojecimiento.",'atendida',3001,1003);

insert into receta (idReceta,idCita,fechaR,observacionesR) values 
(001,1,'2025-11-06',"Reposo 3 días, mantener hidratación, reevaluar si fiebre persiste."),
(002,2,'2025-11-06',"Aplicar capa fina dos veces al día por 5 días; evitar el producto causante."),
(003,3,'2025-11-06',"2 inhalaciones cada 8 horas durante 3 días; control a la semana."),
(004,4,'2025-11-07',"Tomar 1 cápsula diaria antes del desayuno durante 14 días."),
(005,5,'2025-11-08',"Reanudar medicación diaria; medir presión cada 3 días."),
(006,6,'2025-11-08',"Aplicar 2 veces al día durante 14 días; mantener pies secos."),
(007,7,'2025-11-09',"Tomar antibiótico 7 días, analgésico cada 8h; mantener oído seco."),
(008,8,'2025-11-10',"Tratamiento sintomático; líquidos abundantes; reposo domiciliario."),
(009,9,'2025-11-10',"Reposo relativo; evitar cargar peso; analgésico cada 8h."),
(0010,10,'2025-11-11',"1 tableta diaria por 7 días; evitar polvo y flores."),
(0011,11,'2025-11-11',"Mantener dosis actual; control cada 30 días."),
(0012,12,'2025-11-12',"Aplicar capa fina 3 veces/día por 5 días; cubrir con gasa limpia.");

insert into recetaDetalle (idRecetaDetalle, dosis, frecuencia, duracionDias, instrucciones, idReceta, idMedicamento) values 
(01,"500mg","cada 8hs",3,"Reposo 3 días, mantener hidratación, reevaluar si fiebre persiste.",001,7001),
(02,"125mg","cada 8hs",3,"Reposo 3 días, mantener hidratación, reevaluar si fiebre persiste.",001,7002),
(03,"0.05%","dos veces al día",5,"Aplicar capa fina dos veces al día por 5 días; evitar el producto causante.",002,7005),
(04,"dos inhalaciones","cada 8hs",3,"2 inhalaciones cada 8 horas durante 3 días; control a la semana.",003,7004),
(05,"20mg","cada 24hs",14,"Tomar 1 cápsula diaria antes del desayuno durante 14 días.",004,7006),
(06,"50mg","cada 24hs",3,"Reanudar medicación diaria; medir presión cada 3 días.",005,7007),
(07,"25mg","cada 24hs",3,"Reanudar medicación diaria; medir presión cada 3 días.",005,7008),
(08,"1%","cada 12hs",14,"Aplicar 2 veces al día durante 14 días; mantener pies secos.",006,7009),
(09,"125mg","cada 8hs",7,"Tomar antibiótico 7 días, analgésico cada 8h; mantener oído seco.",007,7002),
(010,"500mg","cada 8hs",7,"Tomar antibiótico 7 días, analgésico cada 8h; mantener oído seco.",007,7001),
(011,"jarabe","-",0,"Tratamiento sintomático; líquidos abundantes; reposo domiciliario.",008,70010),
(012,"500mg","-",0,"Tratamiento sintomático; líquidos abundantes; reposo domiciliario.",008,7001),
(013,"400mg","cada 8hs",0,"Reposo relativo; evitar cargar peso; analgésico cada 8h.",009,70011),
(014,"5mg","cada 8hs",0,"Reposo relativo; evitar cargar peso; analgésico cada 8h.",009,70015),
(015,"10mg","cada 24hs",7,"1 tableta diaria por 7 días; evitar polvo y flores.",0010,7003),
(016,"50mg","dosis actual",30,"Mantener dosis actual; control cada 30 días.",0011,7007),
(017,"unguento","3 veces al día",5,"Aplicar capa fina 3 veces/día por 5 días; cubrir con gasa limpia.",0012,70013);


select * from medico;
select * from pacientes;
select * from medicamentos;
select * from citaMedica;
select * from receta;
select * from recetaDetalle;


