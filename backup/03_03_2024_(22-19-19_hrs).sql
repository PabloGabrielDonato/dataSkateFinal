SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS database_rio;

USE database_rio;

DROP TABLE IF EXISTS afiliacionclub;

CREATE TABLE `afiliacionclub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipoafiliacion` varchar(100) COLLATE utf8_bin NOT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO afiliacionclub VALUES("2","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO afiliacionclub VALUES("3","INVITADO","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","0","","","0","","0000-00-00");
INSERT INTO afiliacionclub VALUES("6","AFILIADO-LIGAS","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-27");



DROP TABLE IF EXISTS buenafe;

CREATE TABLE `buenafe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dnibuenafe` bigint(20) NOT NULL,
  `divisional` varchar(20) COLLATE utf8_bin NOT NULL,
  `eficiencia` varchar(100) COLLATE utf8_bin NOT NULL,
  `categoria` varchar(100) COLLATE utf8_bin NOT NULL,
  `disciplina` varchar(100) COLLATE utf8_bin NOT NULL,
  `apagar` bigint(20) DEFAULT NULL,
  `pagado` bigint(100) DEFAULT NULL,
  `torneo` varchar(100) COLLATE utf8_bin NOT NULL,
  `posicion` int(11) DEFAULT NULL,
  `ordensalida` int(11) DEFAULT NULL,
  `fechatorneo` date DEFAULT NULL,
  `horatorneo` time DEFAULT NULL,
  `podiotorneo` int(11) DEFAULT NULL,
  `puntospatinador` int(11) DEFAULT NULL,
  `puntosclub` int(11) DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dnibuenafe` (`dnibuenafe`)
) ENGINE=InnoDB AUTO_INCREMENT=1915 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO buenafe VALUES("1600","52198425","WS","Unica.","Infantil","Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1601","48508548","WS","Unica.","Juvenil","Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Los Gastos operativos se encuentran bonificados por la Federacion.","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1602","52198425","WS","Unica.","Infantil","Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1604","49740472","B","Promocional","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","sss","39587141","Schmidt","Micaela Belen","10014","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-03-01");
INSERT INTO buenafe VALUES("1605","53207033","A","Nacional","Mini infantil","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1606","50276731","B","Tercera","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1607","53295119","B","Promocional","Mini infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1608","53207033","B","Segunda","Mini infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1609","50157087","B","Segunda","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1610","49553670","B","Tercera","Cadete","Figuras Obligatorias","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-13","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1611","49553670","B","Promocional","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-13","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1614","48520755","A","Nacional","Juvenil","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1615","48520755","A","Nacional","Juvenil","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1616","48520755","A","Nacional","Juvenil","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1617","50701570","WS","Unica.","Cadete","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1618","50701570","WS","Unica.","Cadete","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1619","50701570","WS","Unica.","Cadete","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Becado por campeonatos internacionales","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1620","44969164","WS","Unica.","Senior","Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1621","44969164","WS","Unica.","Senior","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Becado por representación internacional","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1622","44969164","WS","Unica.","Senior","Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1623","42428828","WS","Unica.","Senior","In Line","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Becado representación internacional","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1624","49238102","WS","Unica.","Cadete","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Becado representación internacional","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1625","47114486","WS","Unica.","Junior","In Line","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Becado representación internacional","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1626","47114486","WS","Unica.","Junior","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Becada representación internacional","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1627","47708194","B","Intermedio","Juvenil","In Line","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1629","47480865","B","Segunda","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1630","45992257","B","Tercera","Senior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1631","47395749","B","Tercera","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1632","48836498","B","Promocional","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1633","48836442","B","Tercera","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1634","47419025","B","Promocional","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1635","47214927","B","Tercera","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1636","48848775","B","Segunda","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1637","48661501","B","Promocional","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1638","48567040","B","Promocional","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1639","50027681","B","Segunda","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1640","47794592","WS","Unica.","Junior","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1641","47794592","WS","Unica.","Junior","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1642","47794592","WS","Unica.","Junior","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1644","44670473","WS","Unica.","Senior","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1645","44670473","WS","Unica.","Senior","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1646","44670473","WS","Unica.","Senior","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Becado por representación internacional","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1647","46209554","WS","Unica.","Senior","In Line","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Becado por representación internacional","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1648","47058040","A","Pre elite","Senior","Figuras Obligatorias","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1651","46292470","B","Promocional","Senior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1652","48373995","B","Tercera","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1653","52198425","B","Promocional","Infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1654","47756437","B","Promocional","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1655","52018673","B","Promocional","Infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-10","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1658","48508548","WS","Unica.","Juvenil","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Beca Rioplatense","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1659","52198425","WS","Unica.","Infantil","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Beca Rioplatense","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1660","52018673","WS","Unica.","Infantil","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1661","46197445","B","Primera","Senior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1662","50418344","B","Tercera","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1663","48384181","B","Promocional","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1664","47432952","B","Promocional","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1665","49004312","B","Promocional","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1666","52137475","B","Tercera","Infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1667","49758789","B","Tercera","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1668","95985653","B","Promocional","Infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1669","49627788","B","Segunda","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1670","42428828","WS","Unica.","Senior","In Line","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1671","42428828","WS","Unica.","Senior","In Line","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1672","44491718","WS","Unica.","Senior","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Becado, representación internacional","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1673","49602470","B","Segunda","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1674","50885612","B","Segunda","Infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1675","50305726","B","Segunda","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1676","40227211","WS","Unica.","Senior","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Becado, representación internacional","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1677","40227211","WS","Unica.","Senior","Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1678","40227211","WS","Unica.","Senior","Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1679","46499243","WS","Unica.","Senior","Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1680","46499243","WS","Unica.","Senior","Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1681","46874537","B","Segunda","Senior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1682","46272949","WS","Unica.","Senior","Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1683","46272949","WS","Unica.","Senior","Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1684","46272949","WS","Unica.","Senior","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1700","48159819","WS","Unica.","Junior","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1701","48159819","WS","Unica.","Junior","Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1702","48159819","WS","Unica.","Junior","Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1703","48159819","WS","Unica.","Junior","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1704","45679359","WS","Unica.","Senior","Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1705","45679359","WS","Unica.","Senior","Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1706","45679359","WS","Unica.","Senior","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1707","48584419","B","Promocional","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1708","48058771","B","Intermedio","Junior","In Line","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1709","48058771","B","Segunda","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1710","43101629","WS","Unica.","Senior","Pareja Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1711","43101629","WS","Unica.","Senior","Pareja Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1712","43101629","WS","Unica.","Senior","Pareja Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Becado, representación internacional","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1715","47114486","WS","Unica.","Junior","In Line","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20");
INSERT INTO buenafe VALUES("1716","47114486","WS","Unica.","Junior","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1718","47700865","WS","Unica.","Junior","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1719","49006505","A","Nacional","Juvenil","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1720","51067678","WS","Unica.","Infantil","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1721","51067678","A","Nacional","Infantil","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1722","48520656","A","Nacional","Juvenil","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1723","49555402","A","Elite","Cadete","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1724","47654256","A","Elite","Junior","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1725","52454814","WS","Unica.","Infantil","Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1726","46027137","A","Nacional","Senior","Figuras Obligatorias","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1727","50321796","WS","Unica.","Cadete","Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1728","42874079","WS","Unica.","Senior","Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1729","42874079","WS","Unica.","Senior","Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1730","42874079","WS","Unica.","Senior","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1731","42874079","B","Primera","Senior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1732","46759079","A","Nacional","Senior","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1733","46759079","A","Nacional","Senior","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1734","46759079","A","Nacional","Senior","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1735","49760029","B","Segunda","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1736","53292664","A","Nacional","Mini infantil","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1737","53292664","A","Nacional","Mini infantil","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1738","53292664","A","Nacional","Mini infantil","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1739","47387302","A","Elite","Junior","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1740","47756056","B","Promocional","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1741","46499243","WS","Unica.","Senior","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1742","44491718","WS","Unica.","Senior","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1743","50291276","A","Elite","Cadete","Libre","40000","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1744","50291276","A","Elite","Cadete","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1745","47574680","A","Elite","Senior","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1746","50291276","A","Elite","Cadete","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1747","43599600","B","Tercera","Senior","Figuras Obligatorias","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1748","51060545","B","Tercera","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1749","50026371","B","Promocional","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1750","49380115","B","Promocional","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1751","47166273","B","Promocional","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1752","49008377","B","Tercera","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1753","49758668","B","Promocional","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1754","48390271","B","Tercera","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1755","47872480","B","Promocional","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1756","49903793","B","Segunda","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1757","48796768","B","Primera","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1758","49759560","B","Segunda","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1759","47962168","B","Segunda","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1760","52760835","B","Segunda","Infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1761","51583274","B","Tercera","Infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1762","48390010","B","Tercera","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1763","48390010","B","Segunda","Juvenil","Figuras Obligatorias","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1764","44379680","B","Primera","Senior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1765","47295389","B","Segunda","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1766","51120149","B","Promocional","Infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1767","50439782","B","Promocional","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1768","50439782","B","Tercera","Cadete","Figuras Obligatorias","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1769","47790595","B","Promocional","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1770","48574193","B","Promocional","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1772","41588243","WS","Unica.","Senior","Pareja Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1773","41588243","WS","Unica.","Senior","Pareja Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Becada representacion internacional","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1774","45298324","WS","Unica.","Senior","Danza","0","0","CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1775","45298324","WS","Unica.","Senior","Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1779","42201617","B","Segunda","Senior","Figuras Obligatorias","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1780","50321796","B","Primera","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1781","52640968","B","Promocional","Infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1782","50987383","B","Tercera","Infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1783","49185271","B","Segunda","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1784","50651346","B","Promocional","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1785","47872343","B","Segunda","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1786","45753675","B","Segunda","Senior","Figuras Obligatorias","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1787","49702021","B","Segunda","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1788","49918687","B","Segunda","Cadete","Figuras Obligatorias","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1789","49332899","B","Primera","Cadete","Figuras Obligatorias","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1790","38522400","B","Promocional","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1791","48240628","B","Promocional","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1792","48240628","B","Tercera","Junior","Figuras Obligatorias","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1793","52858600","B","Primera","Infantil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1794","48796476","B","Segunda","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1795","48183968","B","Primera","Junior","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1796","43839815","B","Promocional","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1797","50159283","B","Promocional","Cadete","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1798","49255704","B","Segunda","Juvenil","Figuras Obligatorias","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1810","46027137","A","Nacional","Senior","Figuras Obligatorias","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1811","51067678","WS","Unica.","Infantil","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1812","51067678","A","Nacional","Infantil","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1813","47700865","WS","Unica.","Junior","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1814","49555402","A","Elite","Cadete","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1815","47654256","A","Elite","Junior","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1816","49006505","A","Nacional","Juvenil","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1817","48520656","A","Nacional","Juvenil","Libre","25000","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1818","52454814","WS","Unica.","Infantil","Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1819","50321796","WS","Unica.","Cadete","Danza","0","0","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1825","52454814","WS","Unica.","Infantil","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1826","50321796","WS","Unica.","Cadete","Danza","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1827","47700865","WS","Unica.","Junior","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1828","49006505","A","Nacional","Juvenil","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1829","51067678","WS","Unica.","Infantil","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1830","48520656","A","Nacional","Juvenil","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1831","49555402","A","Elite","Cadete","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1832","47654256","A","Elite","Junior","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1840","41904162","WS","Unica.","Senior","Libre","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","Invitado Santa Fe","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1841","49255704","B","Tercera","Juvenil","Libre","18000","0","SELECTIVO. Divisional B. Copa Apertura","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1842","47634056","A","Avanzado","Junior","In Line","18000","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","23208053","Greta Cloe","Cantarelli","10006","DEFENSORES DE CAMBACERES (CBCR)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1844","48508548","WS","Unica.","Juvenil","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1846","52454814","WS","Unica.","Infantil","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1848","44969164","WS","Unica.","Senior","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1850","49238102","WS","Unica.","Cadete","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1852","52198425","WS","Unica.","Infantil","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1854","45679359","WS","Unica.","Senior","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1856","42874079","WS","Unica.","Senior","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1859","48159819","WS","Unica.","Junior","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1861","50321796","WS","Unica.","Cadete","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1863","40227211","WS","Unica.","Senior","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1864","46499243","WS","Unica.","Senior","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1867","46272949","WS","Unica.","Senior","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1869","52018673","WS","Unica.","Infantil","Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1870","48508548","WS","Unica.","Juvenil","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1871","52454814","WS","Unica.","Infantil","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1872","44969164","WS","Unica.","Senior","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1873","49238102","WS","Unica.","Cadete","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1874","52198425","WS","Unica.","Infantil","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1875","45679359","WS","Unica.","Senior","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1876","42874079","WS","Unica.","Senior","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1877","48159819","WS","Unica.","Junior","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1878","50321796","WS","Unica.","Cadete","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1879","40227211","WS","Unica.","Senior","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1880","46499243","WS","Unica.","Senior","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1881","46272949","WS","Unica.","Senior","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1882","52018673","WS","Unica.","Infantil","Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1883","41588243","WS","Unica.","Senior","Pareja Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1884","43101629","WS","Unica.","Senior","Pareja Style","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1885","43101629","WS","Unica.","Senior","Pareja Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1886","41588243","WS","Unica.","Senior","Pareja Free Dance","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1887","47700865","WS","Libre Programa Corto","Junior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1888","47700865","WS","Libre Programa Largo","Junior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1889","50701570","WS","Libre Programa Corto","Cadete","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1890","50701570","WS","Libre Programa Largo","Cadete","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1891","44670473","WS","Libre Programa Corto","Senior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1892","44670473","WS","Libre Programa Largo","Senior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1893","44491718","WS","Libre Programa Corto","Senior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1894","44491718","WS","Libre Programa Largo","Senior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1895","47794592","WS","Libre Programa Corto","Junior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1896","47794592","WS","Libre Programa Largo","Junior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1897","51067678","WS","Libre Programa Corto","Infantil","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1898","51067678","WS","Libre Programa Largo","Infantil","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1899","41904162","WS","Libre Programa Corto","Senior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1900","41904162","WS","Libre Programa Largo","Senior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO buenafe VALUES("1901","48159819","WS","Libre Programa Corto","Junior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1902","48159819","WS","Libre Programa Largo","Junior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1903","47114486","WS","Libre Programa Corto","Junior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1904","47114486","WS","Libre Programa Largo","Junior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1905","47574680","A","Elite PC","Senior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1906","47574680","A","Elite PL","Senior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1907","49555402","A","Elite PC","Cadete","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1908","49555402","A","Elite PL","Cadete","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1909","50291276","A","Elite PC","Cadete","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1910","50291276","A","Elite PL","Cadete","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1911","47654256","A","Elite PC","Junior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1912","47654256","A","Elite PL","Junior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1913","47387302","A","Elite PC","Junior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO buenafe VALUES("1914","47387302","A","Elite PL","Junior","Libre","0","0","RIO. Divisional A y WS. Campeonato Rioplatense","0","0","0000-00-00","00:00:00","0","0","0","ACTIVO","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");



DROP TABLE IF EXISTS categorias;

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) COLLATE utf8_bin NOT NULL,
  `ordencategoria` int(11) DEFAULT NULL,
  `edad_desde` int(11) DEFAULT NULL,
  `edad_hasta` int(11) DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO categorias VALUES("1","Tots","1015","8","9","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","23660292","Sandra","Barzola","11111111111","LEPAA","2024-01-13");
INSERT INTO categorias VALUES("2","Mini infantil","1025","10","11","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04");
INSERT INTO categorias VALUES("3","Infantil","1035","12","13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("4","Cadete","1045","14","15","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("5","Juvenil","1055","16","16","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("6","Junior","1065","17","18","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("7","Senior","1075","19","99","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("8","08 años","1230","8","8","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("9","09 años","1240","9","9","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("10","10 años","1250","10","10","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("11","11 años","1260","11","11","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("12","12 años","1270","12","12","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("13","13 años","1280","13","13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("14","14 años","1290","14","14","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("15","15 años","1300","15","15","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("16","16 y mas años","1310","16","99","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04");
INSERT INTO categorias VALUES("17","04y05 años","1005","4","5","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO categorias VALUES("18","06y07 años","1010","6","7","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO categorias VALUES("19","Clasico","1085","21","27","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("20","Novicio","1095","28","37","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("21","Profesional","1115","38","47","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("22","Master","1125","48","57","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("23","Experto","1135","58","67","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("24","Decano","1145","68","77","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO categorias VALUES("25","Idoneo","1155","78","99","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04");
INSERT INTO categorias VALUES("26","Mayores","1550","17","99","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04");
INSERT INTO categorias VALUES("28","Junior B","1070","13","19","23660292","Sandra","Barzola","11111111111","LEPAA","2023-04-09","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO categorias VALUES("29","Junior A","1067","0","0","23660292","Sandra","Barzola","11111111111","LEPAA","2023-04-09","0","","","0","","0000-00-00");
INSERT INTO categorias VALUES("32","Senior.","1076","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO categorias VALUES("33","Infantil (small)","1650","8","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO categorias VALUES("34","Cadete (Large)","1700","8","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO categorias VALUES("35","Junior (Small)","1750","12","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO categorias VALUES("36","Senior (Large y small)","1800","12","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04");
INSERT INTO categorias VALUES("37","Cadete (Cuarteto)","1710","12","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO categorias VALUES("38","Mayores.","1060","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO categorias VALUES("39","Junior (.)","1064","12","18","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO categorias VALUES("40","Senior (.)","1074","12","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO categorias VALUES("41","Leyenda (.)","1900","8","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO categorias VALUES("42","Senior B","1077","13","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");



DROP TABLE IF EXISTS clubs;

CREATE TABLE `clubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuit` bigint(20) NOT NULL,
  `institucion` varchar(100) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(255) COLLATE utf8_bin NOT NULL,
  `localidad` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefono` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `web` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `tipoafiliacion` varchar(100) COLLATE utf8_bin NOT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`cuit`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO clubs VALUES("61","10001","APANOVI (APNV)","Av. Boedo  1174","CABA","","","APANOVI_PATIN","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","11111111111","LEPAA","2023-12-09","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-02");
INSERT INTO clubs VALUES("62","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","Tronador 41","CABA","1137630888","disciplinas@argentinosjuniors.com.ar","www.argentinosjuniors.com.ar","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10");
INSERT INTO clubs VALUES("63","10003","ARQUITECTURA (ARQ)","X","X","","","","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14");
INSERT INTO clubs VALUES("64","10004","AVE FENIX (AFX)","X","X","","","","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14");
INSERT INTO clubs VALUES("65","10006","DEFENSORES DE CAMBACERES (CBCR)","San Martin 715","ENSENADA","","","","INVITADO","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31");
INSERT INTO clubs VALUES("66","10007","CEMEF (CMEF)","Saenz Peña S/n","JOSE LEON SUAREZ","1140488928","","","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12");
INSERT INTO clubs VALUES("67","10008","CIRCUNVALACION ELITE (CEL)","Calle 7 Entre 77 Y 78 Nro. 2241","LA PLATA","2215399775","","","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13");
INSERT INTO clubs VALUES("68","10009","CLUB ATLETICO LANUS (CAL)","9 De Julio 1680 -","LANUS ESTE","","","www.clublanus.com","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","251334991","Walter","Iglesias","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO clubs VALUES("69","10010","CLUB JOSE HERNANDEZ (JHZ)","X","X","","","","INVITADO","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31");
INSERT INTO clubs VALUES("71","10011","EPAC.CB  (EPAC)","25 E/ 508 Y 511","GONNET. LA PLATA","2216710950","","@epac.cb","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13");
INSERT INTO clubs VALUES("73","10013","FREE SKATE (FSN)","X","X","","","","INVITADO","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31");
INSERT INTO clubs VALUES("75","10014","ITUZAINGO DE TEMPERLEY (ITZ)","X","X","","","","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14");
INSERT INTO clubs VALUES("76","10015","JUNTA  VECINAL VILLA DIAMANTE (JVD)","Jose Maria Moreno 3301","LANUS","1153431128","patin.lajaula@gmail.com","","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-31");
INSERT INTO clubs VALUES("77","10016","LEPAA (LEPAA)","Lincoln 1856","3 DE FEBRERO","","","WWW.LEPAA.COM.AR","AFILIADO-LIGAS","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14");
INSERT INTO clubs VALUES("78","10017","NEW BRAND (NWB)","Pintos 648","LA MATANZA","1136610803","new.brand.patin@gmial.com","","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-11");
INSERT INTO clubs VALUES("79","10018","PATIN PUNTUAR (PNTR)","X","X","","","","AFILIADO-LIGAS","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14");
INSERT INTO clubs VALUES("80","10019","SAN CARLOS WINGS (SCW)","X","CABA","","","","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14");
INSERT INTO clubs VALUES("81","10020","SOC FOM CASTELLI (SFC)","Lorenzini 1425","LONGCHAMPS","42331355","","","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12");
INSERT INTO clubs VALUES("82","10021","SOC FOM ALIANZA (SFAZ)","X","X","","","","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14");
INSERT INTO clubs VALUES("83","10022","SOUTH SKATE (SSK)","Belgrano 58","TRISTAN SUAREZ","1151350547","asoc.southskate@gmail.com","","AFILIADO-LIGAS","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13");
INSERT INTO clubs VALUES("84","10023","UNION SKATE (USK)","X","X","","","","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14");
INSERT INTO clubs VALUES("85","10024","CLUB ATLETICO EL PALOMAR (CAPL)","Av. Ing. Marconi 496","EL PALOMAR - BUENOS AIRES","1139118184","Lpiovicaep@gmail.com","Patinartistico.caep","AFILIADO-INSTITUCION","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO clubs VALUES("86","10025","ESCUELA DE PATINAJE ARTíSTICO Y.D.AR ","Sedes Villa España Y Almafuerte","BERISSO","2214193823","equipo.y.d.ar@gmail.com","","AFILIADO-INSTITUCION","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-30","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-30");
INSERT INTO clubs VALUES("60","9999999999","FEDERACION RIOPLATENSE (FPR)","Hipolito Yrigoyen 2236 - 1er Piso","GERLI","","Patinrioplatense@gmail.com","www.federacionrioplatense.com.ar","AFILIADO-INSTITUCION","23660292","Sandra","Barzola","11111111111","LEPAA","2023-12-07","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-06");



DROP TABLE IF EXISTS ctacte;

CREATE TABLE `ctacte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuit` bigint(100) NOT NULL,
  `tipo_comprobante` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `num_comprobante` bigint(100) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `concepto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `num_comp_pago` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `forma_pago` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `entidad_pago` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `adeudado` bigint(100) DEFAULT NULL,
  `pagado` bigint(100) DEFAULT NULL,
  `saldo` bigint(100) DEFAULT NULL,
  `img_comp_pago` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dnipatinador` bigint(20) DEFAULT NULL,
  `tipolicencia` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `id_depositante` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `num_recibo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `comentarios` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `foto` text COLLATE utf8_bin DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=646 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO ctacte VALUES("120","10009","Ticket","0","2023-12-27","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Solicitud afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-27","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("121","10024","Ticket","0","2023-12-31","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Solicitud afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("122","10008","Ticket","0","2023-12-31","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Solicitud de Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("123","10002","Ticket","0","2023-12-31","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Solicitud de Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("128","10017","Ticket","0","2024-01-12","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro de Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("129","10007","Ticket","0","2024-01-12","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("130","10020","Ticket","0","2024-01-12","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("131","10015","Ticket","0","2024-01-12","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("132","10022","Ticket","0","2024-01-13","AFILIACION","","","","0000-00-00","90000","0","0","","0","","","","Registro afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("133","10011","Ticket","0","2024-01-13","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro Afiliacion 2024\n\n","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("134","10016","Ticket","0","2024-01-14","AFILIACION","","","","0000-00-00","90000","0","0","","0","","","","Registro Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("135","10001","Ticket","0","2024-01-14","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("136","10003","Ticket","0","2024-01-14","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("137","10004","Ticket","0","2024-01-14","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro Aflliacion ","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("138","10018","Ticket","0","2024-01-14","AFILIACION","","","","0000-00-00","90000","0","0","","0","","","","Registro Afiliacion 2024- \n\n","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("139","10019","Ticket","0","2024-01-14","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("140","10021","Ticket","0","2024-01-14","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("141","10023","Ticket","0","2024-01-14","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("142","10014","Ticket","0","2024-01-14","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("143","10025","Ticket","0","2024-01-31","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro de Afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-31","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("144","10009","Ticket","0","2024-02-02","LICENCIAS","","","","0000-00-00","15000","0","0","","33435474","RUD","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("145","10009","Ticket","0","2024-02-02","LICENCIAS","","","","0000-00-00","50000","0","0","","42428828","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("146","10009","Ticket","0","2024-02-02","LICENCIAS","","","","0000-00-00","50000","0","0","","47346955","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("147","10009","Ticket","0","2024-02-02","LICENCIAS","","","","0000-00-00","50000","0","0","","48848775","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("148","10009","Ticket","0","2024-02-02","LICENCIAS","","","","0000-00-00","50000","0","0","","49238102","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("149","10009","Ticket","0","2024-02-02","LICENCIAS","","","","0000-00-00","50000","0","0","","50885612","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("150","10009","Ticket","0","2024-02-02","LICENCIAS","","","","0000-00-00","15000","0","0","","53456494","RUD","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("151","10001","Ticket","0","2024-02-01","LICENCIAS","","","","0000-00-00","50000","0","0","","46759079","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-01","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("152","10001","Ticket","0","2024-02-01","LICENCIAS","","","","0000-00-00","50000","0","0","","47574680","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-01","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("153","10001","Ticket","0","2024-02-01","LICENCIAS","","","","0000-00-00","50000","0","0","","50291276","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-01","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("154","10001","Ticket","0","2024-02-02","LICENCIAS","","","","0000-00-00","50000","0","0","","53292664","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("158","10016","Ticket","0","2024-02-04","LICENCIAS","","","","0000-00-00","50000","0","0","","46292470","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("159","10016","Ticket","0","2024-02-04","LICENCIAS","","","","0000-00-00","50000","0","0","","47756437","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("160","10016","Ticket","0","2024-02-04","LICENCIAS","","","","0000-00-00","50000","0","0","","48373995","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("161","10016","Ticket","0","2024-02-04","LICENCIAS","","","","0000-00-00","45000","0","0","","48519922","PROMOCIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("162","10016","Ticket","0","2024-02-04","LICENCIAS","","","","0000-00-00","50000","0","0","","49731105","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("163","10016","Ticket","0","2024-02-04","LICENCIAS","","","","0000-00-00","50000","0","0","","52198425","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("165","10009","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","47708194","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("166","10009","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","50701570","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("167","10009","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","51168695","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("168","10009","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","15000","0","0","","54510387","RUD","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("172","10009","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","48159819","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("173","10022","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","47747598","NACIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("174","10022","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","47790595","NACIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("175","10022","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","45000","0","0","","49740877","PROMOCIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("176","10022","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","50157087","NACIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("177","10022","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","50276731","NACIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("178","10022","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","45000","0","0","","51327063","PROMOCIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("179","10022","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","53207033","NACIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("180","10022","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","53295119","NACIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("181","10022","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","45000","0","0","","53299744","PROMOCIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("188","10016","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","50000","0","0","","48508548","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("189","10016","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","52018673","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("190","10011","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","47794592","NACIONAL","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("191","10011","Ticket","0","2024-02-10","LICENCIAS","","","","0000-00-00","50000","0","0","","48661501","NACIONAL","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-10","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("192","10011","Ticket","0","2024-02-10","LICENCIAS","","","","0000-00-00","50000","0","0","","49833810","NACIONAL","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-10","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("193","10011","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","50027681","NACIONAL","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("194","10011","Ticket","0","2024-02-10","LICENCIAS","","","","0000-00-00","50000","0","0","","50839224","NACIONAL","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-10","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("195","10011","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","53748756","NACIONAL","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("196","10016","Ticket","0","2024-02-09","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","52198425","Free Dance Combinado","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("197","10016","Ticket","0","2024-02-10","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","48508548","Free Dance Combinado","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-10","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("198","10016","Ticket","0","2024-02-09","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","52198425","Free Dance Combinado","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("199","10016","Ticket","0","2024-02-09","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","48508548","Free Dance Combinado","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("200","10011","Ticket","0","2024-02-13","LICENCIAS","","","","0000-00-00","50000","0","0","","48567040","NACIONAL","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-13","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("201","10001","Ticket","0","2024-02-02","LICENCIAS","","","","0000-00-00","50000","0","0","","47387302","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("202","10014","Ticket","0","2024-02-13","LICENCIAS","","","","0000-00-00","50000","0","0","","49740472","NACIONAL","","","","","39587141","Schmidt","Micaela Belen","10014","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-13","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("203","10014","Ticket","0","2024-02-13","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49740472","Libre","","","","","39587141","Schmidt","Micaela Belen","10014","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-13","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("204","10022","Ticket","0","2024-02-13","LICENCIAS","","","","0000-00-00","50000","0","0","","49553670","NACIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-13","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("205","10022","Ticket","0","2024-02-09","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","53207033","Libre","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("206","10022","Ticket","0","2024-02-09","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50276731","Libre","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("207","10022","Ticket","0","2024-02-09","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","53295119","Libre","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("208","10022","Ticket","0","2024-02-09","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","53207033","Libre","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("209","10022","Ticket","0","2024-02-09","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50157087","Libre","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("210","10022","Ticket","0","2024-02-13","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49553670","Figuras Obligatorias","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-13","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("211","10022","Ticket","0","2024-02-13","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49553670","Libre","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-13","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("214","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","44969164","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("215","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","47114486","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("216","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","47260953","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("217","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","49602470","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("221","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","48520755","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("222","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","45597415","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("223","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","50000","0","0","","45992257","NACIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("224","10007","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","50000","0","0","","46197445","NACIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("225","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","47172065","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("226","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","50000","0","0","","47214927","NACIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("227","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","50000","0","0","","47395749","NACIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("228","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","50000","0","0","","47419025","NACIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("229","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","50000","0","0","","47480865","NACIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("230","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","48308589","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("231","10007","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","50000","0","0","","48836442","NACIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("232","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","48836453","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("233","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","50000","0","0","","48836498","NACIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("234","10007","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","45000","0","0","","48992043","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("235","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","49000144","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("236","10007","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","45000","0","0","","49676990","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("237","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","50291845","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("238","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","50532715","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("239","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","50532779","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("240","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","50547328","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("241","10007","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","45000","0","0","","50637180","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("242","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","52139350","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("243","10007","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","45000","0","0","","53147403","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("244","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","53825929","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("245","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","53876612","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("246","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","54100656","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("247","10007","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","45000","0","0","","54455412","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("248","10007","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","45000","0","0","","54523900","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("249","10007","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","45000","0","0","","54724517","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("250","10007","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","45000","0","0","","96042675","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("251","10007","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","45000","0","0","","96045182","PROMOCIONAL","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("253","10009","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","48520755","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("254","10009","Ticket","0","2024-02-14","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","48520755","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("255","10009","Ticket","0","2024-02-14","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","48520755","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("256","10009","Ticket","0","2024-02-14","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","50701570","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("257","10009","Ticket","0","2024-02-14","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","50701570","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("258","10009","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","50701570","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("259","10009","Ticket","0","2024-02-14","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","44969164","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("260","10009","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","44969164","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("261","10009","Ticket","0","2024-02-14","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","44969164","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("262","10009","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","42428828","In Line","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("263","10009","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","49238102","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("264","10009","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","47114486","In Line","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("265","10009","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","47114486","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("266","10009","Ticket","0","2024-02-14","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47708194","In Line","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("268","10007","Ticket","0","2024-02-14","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47480865","Libre","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("269","10007","Ticket","0","2024-02-14","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","45992257","Libre","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("270","10007","Ticket","0","2024-02-14","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47395749","Libre","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("271","10007","Ticket","0","2024-02-14","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48836498","Libre","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("272","10007","Ticket","0","2024-02-14","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48836442","Libre","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("273","10007","Ticket","0","2024-02-14","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47419025","Libre","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("274","10007","Ticket","0","2024-02-14","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47214927","Libre","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("275","10009","Ticket","0","2024-02-14","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48848775","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("276","10011","Ticket","0","2024-02-13","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("277","10011","Ticket","0","2024-02-14","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48661501","Libre","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("278","10011","Ticket","0","2024-02-14","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48567040","Libre","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("279","10011","Ticket","0","2024-02-14","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50027681","Libre","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("280","10011","Ticket","0","2024-02-14","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","47794592","Libre","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("281","10011","Ticket","0","2024-02-14","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","47794592","Libre","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("282","10011","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","47794592","Libre","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("284","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","46209554","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("285","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","15000","0","0","","53948364","RUD","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("286","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","47058040","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("287","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","49627788","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("288","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","44670473","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("289","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","48651161","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("290","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","47756056","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("291","10009","Ticket","0","2024-02-14","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","44670473","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("292","10009","Ticket","0","2024-02-14","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","44670473","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("293","10009","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","44670473","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("294","10009","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","46209554","In Line","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("295","10009","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","47058040","Figuras Obligatorias","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("298","10011","Recibo","0","2024-02-15","AFILIACION","7329","Transferencia","Galicia","2024-02-13","0","60000","0","","0","","27367782620","","","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("299","10011","Credito","0","2024-02-15","AFILIACION","","","","0000-00-00","0","60000","0","","0","","","","Se duplico el ticket de pago de afiliacion","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("300","10011","Credito","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","0","18000","0","","0","","","","Becado por ser campeon nacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("301","10002","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","51067678","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("302","10002","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","50321796","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("303","10002","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","47654256","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("304","10002","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","49006505","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("305","10016","Ticket","0","2024-02-09","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","46292470","Libre","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("306","10016","Ticket","0","2024-02-09","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48373995","Libre","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("307","10016","Ticket","0","2024-02-09","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","52198425","Libre","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("308","10016","Ticket","0","2024-02-09","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47756437","Libre","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("309","10016","Ticket","0","2024-02-10","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","52018673","Libre","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-10","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("312","10016","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","48508548","Free Dance Combinado","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("313","10016","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","52198425","Free Dance Combinado","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("314","10016","Ticket","0","2024-02-14","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","52018673","Free Dance Combinado","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("315","10001","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","42874079","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("316","10007","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","46197445","Libre","","","","","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("317","10001","Recibo","0","2024-02-15","LICENCIAS","5067","Transferencia","Cuenta DNI","2024-02-07","0","50000","0","","0","","","","Zuccarelli Valentina","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("318","10011","Recibo","0","2024-02-15","LICENCIAS","3765","Transferencia","Santander","2024-02-06","0","50000","0","","0","","27230173732","","Licencia Carneirinho","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("319","10011","Recibo","0","2024-02-15","LICENCIAS","9522","Transferencia","Cuenta DNI","2024-02-08","0","50000","0","","0","","27391594878","","Licencia Buze","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("320","10011","Recibo","0","2024-02-15","LICENCIAS","0208","Transferencia","BBVA","2024-02-08","0","50000","0","","0","","53748756","","Licencia Cubiatebehere Catalina","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("321","10011","Recibo","0","2024-02-15","LICENCIAS","0208bis","Transferencia","BBVA","2024-02-08","0","50000","0","","0","","50027681","","Licencia Cubiatebehere Agustina","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("322","10011","Credito","0","2024-02-15","LICENCIAS","","","","0000-00-00","0","50000","0","","0","","","","Licencia Sanfilipo","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("323","10011","Recibo","0","2024-02-15","LICENCIAS","9531","Transferencia","Provincia","2024-02-08","0","50000","0","","0","","47794592","","Licencia Louseau","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("324","10006","Ticket","0","2024-02-15","AFILIACION","","","","0000-00-00","60000","0","0","","0","","","","Registro afiliacion 2024","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("325","10016","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","49761918","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("326","10016","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","50418344","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("327","10016","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","48384181","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("328","10016","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","47432952","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("329","10016","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","49004312","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("330","10016","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","52137475","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("331","10016","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","49758789","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("332","10016","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","95985653","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("333","10016","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50418344","Libre","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("334","10016","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48384181","Libre","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("335","10016","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47432952","Libre","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("336","10016","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49004312","Libre","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("337","10016","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","52137475","Libre","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("338","10016","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49758789","Libre","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("339","10016","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","95985653","Libre","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("340","10001","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","49760029","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("341","10009","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","45679359","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("342","10009","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","50305726","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("343","10009","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","40227211","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("344","10009","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","46499243","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("345","10009","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","50145601","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("346","10009","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","46272949","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("347","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","44491718","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("348","10009","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","48584419","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("349","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","50000","0","0","","46874537","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("350","10009","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49627788","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("351","10009","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","42428828","In Line","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("352","10009","Ticket","0","2024-02-15","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","42428828","In Line","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("353","10009","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","44491718","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("354","10009","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49602470","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("355","10009","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50885612","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("356","10009","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50305726","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("357","10009","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","40227211","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("358","10009","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","40227211","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("359","10009","Ticket","0","2024-02-15","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","40227211","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("360","10009","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","46499243","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("361","10009","Ticket","0","2024-02-15","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","46499243","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("362","10009","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","46874537","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("363","10009","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","46272949","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("364","10009","Ticket","0","2024-02-15","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","46272949","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("365","10009","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","46272949","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("381","10002","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","47700865","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("382","10002","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","49555402","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("383","10009","Ticket","0","2024-02-14","LICENCIAS","","","","0000-00-00","15000","0","0","","51245914","RUD","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("384","10002","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","48520656","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("385","10009","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","43101629","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("386","10009","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","48058771","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("387","10009","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","48159819","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("388","10009","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","48159819","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("389","10009","Ticket","0","2024-02-15","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","48159819","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("390","10009","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","48159819","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("391","10009","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","45679359","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("392","10009","Ticket","0","2024-02-15","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","45679359","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("393","10009","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","45679359","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("394","10009","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48584419","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("395","10009","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48058771","In Line","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("396","10009","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48058771","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("397","10009","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","43101629","Pareja Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("398","10009","Ticket","0","2024-02-15","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","43101629","Pareja Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("399","10009","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","43101629","Pareja Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("402","10009","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","47114486","In Line","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("403","10009","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","47114486","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("405","10002","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","47700865","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("406","10002","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","49006505","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("407","10002","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","51067678","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("408","10002","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","51067678","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("409","10002","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","48520656","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("410","10002","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","49555402","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("411","10002","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","47654256","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("412","10002","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","52454814","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("413","10002","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","46027137","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("414","10002","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","52454814","Free Dance Combinado","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("415","10002","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","46027137","Figuras Obligatorias","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("416","10002","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","50321796","Free Dance Combinado","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("417","10001","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","42874079","Free Dance Combinado","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("418","10001","Ticket","0","2024-02-15","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","42874079","Free Dance Combinado","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("419","10001","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","42874079","Free Dance Combinado","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("420","10001","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","42874079","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("421","10001","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","46759079","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("422","10001","Ticket","0","2024-02-15","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","46759079","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("423","10001","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","46759079","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("424","10001","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49760029","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("425","10001","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","53292664","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("426","10001","Ticket","0","2024-02-15","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","53292664","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("427","10001","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","53292664","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("428","10001","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","47387302","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("429","10009","Ticket","0","2024-02-15","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47756056","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("430","10009","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","46499243","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("431","10009","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","44491718","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("432","10001","Ticket","0","2024-02-15","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","50291276","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("433","10001","Ticket","0","2024-02-15","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","50291276","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("434","10001","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","47574680","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("435","10001","Ticket","0","2024-02-15","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","50291276","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("436","10022","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","45000","0","0","","55145223","PROMOCIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("437","10022","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","45000","0","0","","53063861","PROMOCIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("438","10011","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","43860264","NACIONAL","","","","","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("439","10018","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","43599600","NACIONAL","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("440","10018","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","47166273","NACIONAL","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("441","10018","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","49008377","NACIONAL","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("442","10018","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","49380115","NACIONAL","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("443","10018","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","49758668","NACIONAL","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("444","10018","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","50026371","NACIONAL","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("445","10018","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","51060545","NACIONAL","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("446","10024","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","50000","0","0","","49086992","NACIONAL","","","","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("447","10024","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","48390271","NACIONAL","","","","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("448","10024","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","50000","0","0","","47872480","NACIONAL","","","","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("449","10024","Ticket","0","2024-02-07","LICENCIAS","","","","0000-00-00","50000","0","0","","49903793","NACIONAL","","","","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("450","10024","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","50000","0","0","","48796768","NACIONAL","","","","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("451","10024","Ticket","0","2024-02-08","LICENCIAS","","","","0000-00-00","50000","0","0","","49759560","NACIONAL","","","","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("452","10009","Recibo","0","2024-02-16","LICENCIAS","5032","Transferencia","Galicia","2024-01-23","0","50000","0","","0","","23424288284","","Licencia Coscarelli","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("453","10009","Recibo","0","2024-02-16","LICENCIAS","","Transferencia","Galicia","2024-02-10","0","50000","0","","0","","20183179773","9759","Licencia Criso","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("454","10009","Recibo","0","2024-02-16","LICENCIAS","9006","Transferencia","Cuenta DNI","2024-02-05","0","50000","0","","0","","29383781","","Licencia Fernandez Nahiara","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("455","10009","Recibo","0","2024-02-16","LICENCIAS","8630","Transferencia","MP","2024-01-27","0","50000","0","","0","","27307618147","","Licencia Gallego Valentina","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("456","10018","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","43599600","Figuras Obligatorias","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("457","10018","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","51060545","Libre","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("458","10018","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50026371","Libre","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("459","10018","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49380115","Libre","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("460","10018","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47166273","Libre","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("461","10018","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49008377","Libre","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("462","10018","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49758668","Libre","","","","","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("463","10009","Recibo","0","2024-02-16","LICENCIAS","2233","Transferencia","Santander","2024-02-09","0","50000","0","","0","","","","Liciencia Garcia Berdardini ","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("464","10009","Recibo","0","2024-02-16","LICENCIAS","7009","Transferencia","Santander","2024-02-08","0","50000","0","","0","","","","Licencia Massimino Victoria","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("465","10009","Recibo","0","2024-02-16","LICENCIAS","7045","Transferencia","Galicia","2024-02-08","0","50000","0","","0","","27256777458","","Licencia Pino Athina","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("466","10009","Recibo","0","2024-02-16","LICENCIAS","4966","Transferencia","MP","2024-02-10","0","50000","0","","0","","27503057269","","Licencia Pitrela","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("467","10009","Recibo","0","2024-02-16","LICENCIAS","0823","Transferencia","Santander","2024-02-10","0","50000","0","","0","","","","Licencia Prieto Luciano","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("468","10024","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48390271","Libre","","","","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("469","10024","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47872480","Libre","","","","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("470","10024","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49903793","Libre","","","","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("471","10024","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48796768","Libre","","","","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("472","10024","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49759560","Libre","","","","","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("473","10001","Ticket","0","2024-02-15","LICENCIAS","","","","0000-00-00","50000","0","0","","47962168","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("474","10001","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","52760835","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("475","10001","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","51583274","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("476","10001","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","48390010","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("477","10001","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","44379680","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("478","10001","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","45000","0","0","","47295389","PROMOCIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("479","10001","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","51120149","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("480","10001","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","50439782","NACIONAL","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("481","10009","Recibo","0","2024-02-16","LICENCIAS","0977","Transferencia","Cuenta DNI","2024-02-01","0","50000","0","","0","","27667080","","Licencia Rodriguez Carolina","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("482","10009","Recibo","0","2024-02-16","LICENCIAS","7390","Transferencia","Cuenta DNI","2024-02-08","0","50000","0","","0","","27667080","","Licencia Rodriguez Martina","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("483","10009","Recibo","0","2024-02-16","LICENCIAS","2723","Transferencia","Cuenta DNI","2024-02-06","0","50000","0","","0","","30910320","","Licencia Sequeira","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("484","10009","Recibo","0","2024-02-16","LICENCIAS","0104","Transferencia","BBVA","2024-01-04","0","50000","0","","0","","","","Licencia Susundey ","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("485","10009","Recibo","0","2024-02-16","LICENCIAS","0131","Transferencia","","2024-01-31","0","50000","0","","0","","","","Licencia Vilariño","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("486","10009","Recibo","0","2024-02-16","LICENCIAS","6877","Transferencia","MP","2024-02-13","0","50000","0","","0","","20254333493","","Licencia Corsaro Anahi","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("487","10009","Recibo","0","2024-02-16","LICENCIAS","3500","Transferencia","HSBC","2024-02-07","0","50000","0","","0","","","","Licencia Maidana","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("488","10009","Recibo","0","2024-02-16","LICENCIAS","1052","Transferencia","MP","2024-02-12","0","35000","0","","0","","27206357695","","Licencia Scamarda","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("489","10009","Recibo","0","2024-02-16","LICENCIAS","9477","Transferencia","Patagonia","2024-02-13","0","50000","0","","0","","2010137147","","Licencia Virgilio","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("490","10001","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47962168","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("491","10001","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","52760835","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("492","10001","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","51583274","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("493","10001","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48390010","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("494","10001","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48390010","Figuras Obligatorias","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("495","10001","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","44379680","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("496","10001","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47295389","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("497","10001","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","51120149","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("498","10001","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50439782","Libre","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("499","10001","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50439782","Figuras Obligatorias","","","","","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("500","10009","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","41588243","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("501","10009","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","42575612","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("502","10022","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","48574193","NACIONAL","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("503","10022","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47790595","Libre","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("504","10022","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48574193","Libre","","","","","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("506","10009","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","45298324","NACIONAL","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("507","10009","Ticket","0","2024-02-16","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","41588243","Pareja Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("508","10009","Ticket","0","2024-02-16","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","41588243","Pareja Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("509","10009","Ticket","0","2024-02-16","CAP. Copa Apertura A y WS","","","","0000-00-00","40000","0","0","","45298324","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("510","10009","Ticket","0","2024-02-16","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","45298324","Free Dance Combinado","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("514","10009","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","0","0","0","","41904162","CAP INVITADOS","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("515","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","38522400","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("516","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","42201617","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("517","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","43839815","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("518","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","45753675","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("519","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","47872343","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("520","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","48183968","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("521","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","48240628","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("522","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","48796476","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("523","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","49185271","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("524","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","49255704","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("525","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","49332899","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("526","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","49702021","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("527","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","49918687","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("528","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","50159283","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("529","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","50651346","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("530","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","50987383","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("531","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","52640968","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("532","10002","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","52858600","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("546","10002","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","42201617","Figuras Obligatorias","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("547","10002","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50321796","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("548","10002","Ticket","0","2024-02-16","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","52640968","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("549","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50987383","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("550","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49185271","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("551","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50651346","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("552","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","47872343","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("553","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","45753675","Figuras Obligatorias","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("554","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49702021","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("555","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49918687","Figuras Obligatorias","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("556","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49332899","Figuras Obligatorias","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("557","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","38522400","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("558","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48240628","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("559","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48240628","Figuras Obligatorias","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("560","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","52858600","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("561","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48796476","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("562","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","48183968","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("563","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","43839815","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("564","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","50159283","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("565","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49255704","Figuras Obligatorias","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("577","10002","Ticket","0","2024-02-17","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","46027137","Figuras Obligatorias","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("578","10002","Ticket","0","2024-02-17","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","51067678","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("579","10002","Ticket","0","2024-02-17","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","51067678","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("580","10002","Ticket","0","2024-02-17","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","47700865","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("581","10002","Ticket","0","2024-02-17","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","49555402","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("582","10002","Ticket","0","2024-02-17","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","47654256","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("583","10002","Ticket","0","2024-02-17","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","49006505","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("584","10002","Ticket","0","2024-02-17","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","48520656","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("585","10002","Ticket","0","2024-02-17","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","52454814","Free Dance Combinado","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("586","10002","Ticket","0","2024-02-17","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","25000","0","0","","50321796","Free Dance Combinado","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("592","10002","Ticket","0","2024-02-17","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","52454814","Free Dance Combinado","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("593","10002","Ticket","0","2024-02-17","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","50321796","Free Dance Combinado","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("594","10002","Ticket","0","2024-02-17","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","47700865","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("595","10002","Ticket","0","2024-02-17","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","49006505","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("596","10002","Ticket","0","2024-02-17","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","51067678","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("597","10002","Ticket","0","2024-02-17","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","48520656","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("598","10002","Ticket","0","2024-02-17","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","49555402","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("599","10002","Ticket","0","2024-02-17","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","47654256","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("607","10009","Ticket","0","2024-02-16","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","41904162","Libre","","","","","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("608","10002","Ticket","0","2024-02-17","SELECTIVO. Divisional B. Copa Apertura","","","","0000-00-00","18000","0","0","","49255704","Libre","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("609","10006","Ticket","0","2024-02-16","LICENCIAS","","","","0000-00-00","50000","0","0","","47634056","NACIONAL","","","","","23208053","Greta Cloe","Cantarelli","10006","DEFENSORES DE CAMBACERES (CBCR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("610","10006","Ticket","0","2024-02-17","RIO. Divisional A y WS. Campeonato Rioplatense","","","","0000-00-00","18000","0","0","","47634056","In Line","","","","","23208053","Greta Cloe","Cantarelli","10006","DEFENSORES DE CAMBACERES (CBCR)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("611","10001","Recibo","0","2024-02-19","CAP. Copa Apertura A y WS","6580","Transferencia","MP","2024-02-15","0","40000","0","","0","","27467596796","","Gomez Costado Copa Cap","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("612","10001","Recibo","0","2024-02-19","CAP. Copa Apertura A y WS","4246","Transferencia","Santander","2024-02-16","0","40000","0","","0","","","","Pirovano Felicita Copa Cap","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("613","10001","Recibo","0","2024-02-19","CAP. Copa Apertura A y WS","","Deposito","","2024-02-16","0","5000","0","","0","","","","Mik Emilia Copa Cap","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("614","10001","Recibo","0","2024-02-19","CAP. Copa Apertura A y WS","7429","Transferencia","MP","2024-02-15","0","40000","0","","0","","27428740799","","Gianuzzi Gianella Copa Cap","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("615","10001","Recibo","0","2024-02-19","CAP. Copa Apertura A y WS","0744","Transferencia","Cuenta DNI","2024-02-13","0","35000","0","","0","","28521886","","Mik Emilia Cancelacion Copa Cap","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("616","10001","Recibo","0","2024-02-19","CAP. Copa Apertura A y WS","","Transferencia","","2024-02-19","0","100000","0","","0","","","","4 Gastos Operativos Copa Cap APANOVI","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("617","10001","Credito","0","2024-02-19","CAP. Copa Apertura A y WS","","","","0000-00-00","0","100000","0","","0","","","","Eran Gastos operativos y fue cargado en inscripciones","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("618","10001","Credito","0","2024-02-19","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","0","100000","0","","0","","","","Gastos Operativo Copa Cap Apanovi","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("619","10011","Recibo","0","2024-02-19","CAP. Copa Apertura A y WS","2609","Transferencia","Provincia","2024-02-14","0","40000","0","","0","","","","Loiseau Ulises Copa A e Internacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("620","10011","Recibo","0","2024-02-19","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","Transferencia","","2024-02-14","0","25000","0","","0","","","","Gatos Operativos Copa A e internacional EPAC","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("621","10016","Recibo","0","2024-02-19","CAP. Copa Apertura A y WS","7177","Transferencia","MP","2024-02-10","0","40000","0","","0","","27234310165","","Garcia Guadalupe Copa  A e Internacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("622","10016","Recibo","0","2024-02-19","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","7177","Transferencia","","2024-02-10","0","25000","0","","0","","27234310165","","Gatos Operativo Copa A e Internacional Lepaa","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("623","10009","Recibo","0","2024-02-19","CAP. Copa Apertura A y WS","0823","Transferencia","Santander","2024-02-10","0","40000","0","","0","","","","Prieto Luciano Copa A e Internacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("624","10009","Recibo","0","2024-02-19","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","0823","Transferencia","Santander","2024-02-10","0","25000","0","","0","","","","Gastos Operativos Copa A e Internacional Lanus","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("625","10001","Debito","0","2024-02-19","CAP. Copa Apertura A y WS","","","","0000-00-00","200000","0","0","","0","","","","Mal cargado 200000","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("626","10016","Credito","0","2024-02-20","CAP. Copa Apertura A y WS","","","","0000-00-00","0","40000","0","","0","","","","Baja de Barrios Canay Morena","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("627","10016","Credito","0","2024-02-20","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","","","0000-00-00","0","25000","0","","0","","","","Baja Barrios Canay Morena","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("628","10002","Recibo","0","2024-02-20","CAP. Copa Apertura A y WS","7119","Transferencia","Macro","2024-02-14","0","40000","0","","0","","","","Paredes Delfina Copa A e Internacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("629","10002","Recibo","0","2024-02-20","CAP. Copa Apertura A y WS","4173","Transferencia","ICBC","2024-02-13","0","40000","0","","0","","","","Caldano Sofia Copa A e Internacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("630","10002","Recibo","0","2024-02-20","CAP. Copa Apertura A y WS","4886","Transferencia","Galicia","2024-02-15","0","80000","0","","0","","20337478841","","Victoria Maquioli Copa Apertura A e Internacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("631","10002","Recibo","0","2024-02-20","CAP. Copa Apertura A y WS","6379","Transferencia","Ciudad","2024-02-15","0","40000","0","","0","","27302763041","","Orozco Abril","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("632","10002","Recibo","0","2024-02-20","CAP. Copa Apertura A y WS","3017","Transferencia","Personal Play","2024-02-17","0","40000","0","","0","","","27231923069","Perez Alma Copa A e Internacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("633","10002","Recibo","0","2024-02-20","CAP. Copa Apertura A y WS","9936","Transferencia","Credicoop","2024-02-15","0","40000","0","","0","","","","Muller Bianca Copa A e Internacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("634","10002","Recibo","0","2024-02-20","CAP. Copa Apertura A y WS","0214","Transferencia","BBVA","2024-02-14","0","40000","0","","0","","","","Buffa Emma Copa A e Internacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("635","10002","Recibo","0","2024-02-20","CAP. Copa Apertura A y WS","565B3","Transferencia","Personal Play","2024-02-15","0","40000","0","","0","","","","Selan Valentina Copa A e Internacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("636","10002","Recibo","0","2024-02-20","CAP. Copa Apertura A y WS","0399/8384/2044","Transferencia","Patagonia","2024-02-09","0","40000","0","","0","","","","Caceres Victoria Copa A e Intenacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("637","10002","Recibo","0","2024-02-20","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","","Transferencia","","2024-02-20","0","225000","0","","0","","","","9 Gastos operativos AAAJ - Copa A e internacional.\n\n\n\nSe pago 25000 de mas de Maquioli que compite en las dos copas A e internacional","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("638","10002","Ticket","0","2024-02-20","LICENCIAS","","","","0000-00-00","50000","0","0","","51511594","NACIONAL","","","","","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-20","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("639","10001","Recibo","0","2024-02-22","LICENCIAS","0169","Transferencia","MP","2024-02-09","0","50000","0","","0","","27428740799","","Licencia Gianuzzi Gianella","","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("640","10016","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","50304793","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("641","10016","Ticket","0","2024-02-09","LICENCIAS","","","","0000-00-00","50000","0","0","","50076089","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO ctacte VALUES("642","10016","Ticket","","2024-02-09","LICENCIAS","","","","","50000","0","","","49550939","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","","","","","","");
INSERT INTO ctacte VALUES("643","10016","Ticket","","2024-02-27","LICENCIAS","","","","","50000","0","","","444","NACIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-27","","","","","","");
INSERT INTO ctacte VALUES("644","10016","Ticket","","2024-02-09","LICENCIAS","","","","","45000","0","","","52785883","PROMOCIONAL","","","","","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","","","","","","");
INSERT INTO ctacte VALUES("645","10016","Recibo","","2024-02-29","PASES","","Efectivo","","2024-02-29","0","15000","","","","","","0","gggggggggg","65e085bfdfd2b_7644.jpg","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-29","","","","","","");



DROP TABLE IF EXISTS delegados;

CREATE TABLE `delegados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` bigint(20) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `apellido` varchar(100) COLLATE utf8_bin NOT NULL,
  `telefono` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `tipo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cuit` bigint(20) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO delegados VALUES("5","16762606","Liliana","Camacho","1165235851","TITULAR","9999999999","lily_camacho@yahoo.com.ar","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-18","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26");
INSERT INTO delegados VALUES("6","39388663","Ayrton","Rueda","1136610804","TITULAR","10017","Ayrton_rueda@hotmail.com","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12","0","","","0","","0000-00-00");
INSERT INTO delegados VALUES("7","23192306","Karina Alejandra","Ceballos","1157075153","SUPLENTE","10002","patinadores.aajj@gmail.com","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13","0","","","0","","0000-00-00");
INSERT INTO delegados VALUES("8","26328130","Romina Bernardette","Carmona","1158025823","TITULAR","10022","patincatartisico@gmail.com","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13","0","","","0","","0000-00-00");
INSERT INTO delegados VALUES("9","41588243","Rocio Abril","Cacciato","1149485785","SUPLENTE","10016","lepaa@outlook.com.ar","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13","0","","","0","","0000-00-00");
INSERT INTO delegados VALUES("10","23660292","Sandra Del Valle","Barzola","1141411555","TITULAR","10016","lepaa@outlook.com.ar","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13","0","","","0","","0000-00-00");



DROP TABLE IF EXISTS disciplinas;

CREATE TABLE `disciplinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disciplina` varchar(100) COLLATE utf8_bin NOT NULL,
  `ordendisciplina` int(11) DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO disciplinas VALUES("35","Libre","2000","23660292","Sandra Del Valle","Barzola","11222333","LEPAA","2022-07-26","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO disciplinas VALUES("36","Danzas Obligatorias","4100","23660292","Sandra Del Valle","Barzola","11222333","LEPAA","2022-07-26","99991","Donatware","Programas","99999","DONATWARE","2024-02-07");
INSERT INTO disciplinas VALUES("37","Figuras Obligatorias","1000","23660292","Sandra Del Valle","Barzola","11222333","LEPAA","2022-07-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04");
INSERT INTO disciplinas VALUES("38","In Line","3000","23660292","Sandra Del Valle","Barzola","11222333","LEPAA","2022-07-26","23660292","Sandra","Barzola","11111111111","LEPAA","2024-01-13");
INSERT INTO disciplinas VALUES("40","Free Dance","4300","23660292","Sandra Del Valle","Barzola","11222333","LEPAA","2022-07-26","99991","Donatware","Programas","99999","DONATWARE","2024-02-07");
INSERT INTO disciplinas VALUES("42","Cuarteto","5000","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO disciplinas VALUES("44","Fig. sincronizada","6000","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO disciplinas VALUES("45","Grupo grande","5500","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO disciplinas VALUES("46","Grupo Junior","5600","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO disciplinas VALUES("47","Grupo pequeño","5700","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO disciplinas VALUES("48","Pareja Danza Combinado","4850","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO disciplinas VALUES("49","Pareja Danza Obligatoria","4700","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO disciplinas VALUES("50","Pareja Danza","4800","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO disciplinas VALUES("51","Pareja mixta","2500","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO disciplinas VALUES("52","Parejas Mixtas","4900","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO disciplinas VALUES("53","Precision","5800","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO disciplinas VALUES("54","Danza","4350","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO disciplinas VALUES("58","Pareja Free Dance","4750","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","99991","Donatware","Programas","99999","DONATWARE","2024-02-07");
INSERT INTO disciplinas VALUES("59","Libre.","7000","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-09");
INSERT INTO disciplinas VALUES("60","Style","4120","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO disciplinas VALUES("61","Pareja Style","4751","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","99991","Donatware","Programas","99999","DONATWARE","2024-02-09");



DROP TABLE IF EXISTS divisional;

CREATE TABLE `divisional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `divisional` varchar(100) COLLATE utf8_bin NOT NULL,
  `ordendivisional` int(11) DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO divisional VALUES("6","A","2000","22645400","Mariano F","Donato","30536802939","LEPAA","2023-01-12","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO divisional VALUES("7","B","3000","22645400","Mariano F","Donato","30536802939","LEPAA","2023-01-12","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO divisional VALUES("8","C","4000","22645400","Mariano F","Donato","30536802939","LEPAA","2023-01-12","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO divisional VALUES("9","WS","1000","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-12","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO divisional VALUES("10","INICIACION","8000","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-15","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO divisional VALUES("11","ADULTOS","6000","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-17","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO divisional VALUES("12","NACIONAL","5000","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-18","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO divisional VALUES("13","PROMOCION","7000","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19","23660292","Sandra","Barzola","11111111111","LEPAA","2023-04-11");
INSERT INTO divisional VALUES("14","EXHIBICION","7500","23660292","Sandra","Barzola","11111111111","LEPAA","2023-07-04","0","","","0","","0000-00-00");
INSERT INTO divisional VALUES("15","ADAPTADOS","6500","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-29","0","","","0","","0000-00-00");



DROP TABLE IF EXISTS eficiencia;

CREATE TABLE `eficiencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eficiencia` varchar(100) COLLATE utf8_bin NOT NULL,
  `ordeneficiencia` int(11) DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO eficiencia VALUES("4","Elite","2970","22645400","Mariano F","Donato","30536802939","LEPAA","2023-01-12","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("5","Primera","1080","22645400","Mariano F","Donato","30536802939","LEPAA","2023-01-12","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("6","Nacional","3000","22645400","Mariano F","Donato","30536802939","LEPAA","2023-01-12","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("7","Unica.","2000","22645400","Mariano F","Donato","30536802939","LEPAA","2023-01-12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-09");
INSERT INTO eficiencia VALUES("8","Segunda","1070","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("9","Tercera","1060","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("10","Cuarta","1040","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("11","Quinta","1030","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("13","Debutante","1010","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("14","Iniciacion","5000","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("15","Promocional","1050","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("16","Avanzado","4300","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("17","Intermedio","4200","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("18","Preliminiar","4100","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("19","Basica","1040","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("20","Leyenda","2980","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("21","Pre elite","2960","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("22","Basico","2950","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-13","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19");
INSERT INTO eficiencia VALUES("23","Basico GM","2940","23660292","Sandra","Barzola","11111111111","LEPAA","2023-01-17","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO eficiencia VALUES("27","Unica","9000","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-19","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("28","Combinada","2100","23660292","Sandra","Barzola","11111111111","LEPAA","2023-03-24","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("29","Escuela Formativa","1021","23660292","Sandra","Barzola","11111111111","LEPAA","2023-04-08","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("31","Tercera C - Exhibicion","4600","23660292","Sandra","Barzola","11111111111","LEPAA","2023-04-08","23660292","Sandra","Barzola","11111111111","LEPAA","2023-04-12");
INSERT INTO eficiencia VALUES("32","Principiantes","5500","23660292","Sandra","Barzola","11111111111","LEPAA","2023-04-08","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("33","Avanzado GM ","4250","23660292","Sandra","Barzola","11111111111","LEPAA","2023-04-09","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("36","Elite PC","2968","23660292","Sandra","Barzola","11111111111","LEPAA","2023-04-22","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("37","Elite PL","2969","23660292","Sandra","Barzola","11111111111","LEPAA","2023-04-22","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("39","Elite Combinada","2971","23660292","Sandra","Barzola","11111111111","LEPAA","2023-05-26","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("40","Inicial","4150","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("41","RR","4000","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("42","GM","4100","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("43","Eficiencia E","6000","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("44","Eficiencia D","6100","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("45","Eficiencia C","6200","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("46","Eficiencia B","6300","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("47","Eficiencia A","6400","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("48","Eficiencia Cuarta","6500","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("49","Eficiencia Tercera","6600","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("50","Eficiencia Segunda","6700","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("51","Eficiencia Primera","6800","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("52","Eficiencia Formativa","6900","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("53","Eficiencia Cuarta C","7000","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("54","Eficiencia Tercera C","7100","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("55","Eficiencia Segunda C","7200","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("56","Eficiencia Primera C","7300","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("57","Eficiencia Tercera B","7400","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("58","Eficiencia Segunda B","7500","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("59","Eficiencia Primera B","7600","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("60","Intermedia","2965","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO eficiencia VALUES("61","Libre Programa Corto","2040","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21");
INSERT INTO eficiencia VALUES("62","Libre Programa Largo","2060","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");



DROP TABLE IF EXISTS estadopadron;

CREATE TABLE `estadopadron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO estadopadron VALUES("1","ABIERTO");



DROP TABLE IF EXISTS hbuenafe;

CREATE TABLE `hbuenafe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dnibuenafe` bigint(20) NOT NULL,
  `divisional` varchar(20) COLLATE utf8_bin NOT NULL,
  `eficiencia` varchar(100) COLLATE utf8_bin NOT NULL,
  `categoria` varchar(100) COLLATE utf8_bin NOT NULL,
  `disciplina` varchar(100) COLLATE utf8_bin NOT NULL,
  `apagar` bigint(20) DEFAULT NULL,
  `pagado` bigint(100) DEFAULT NULL,
  `torneo` varchar(100) COLLATE utf8_bin NOT NULL,
  `posicion` int(11) DEFAULT NULL,
  `ordensalida` int(11) DEFAULT NULL,
  `fechatorneo` date DEFAULT NULL,
  `horatorneo` time DEFAULT NULL,
  `podiotorneo` int(11) DEFAULT NULL,
  `puntospatinador` int(11) DEFAULT NULL,
  `puntosclub` int(11) DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dnibuenafe` (`dnibuenafe`)
) ENGINE=InnoDB AUTO_INCREMENT=1586 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




DROP TABLE IF EXISTS ingresos;

CREATE TABLE `ingresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dniingreso` varchar(100) COLLATE utf8_bin NOT NULL,
  `nombreingreso` varchar(100) COLLATE utf8_bin NOT NULL,
  `apellidoingreso` varchar(100) COLLATE utf8_bin NOT NULL,
  `institucioningreso` varchar(100) COLLATE utf8_bin NOT NULL,
  `fechaingreso` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1284 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO ingresos VALUES("1008","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14 19:10:25");
INSERT INTO ingresos VALUES("1009","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14 19:21:01");
INSERT INTO ingresos VALUES("1010","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14 20:00:45");
INSERT INTO ingresos VALUES("1011","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14 22:18:04");
INSERT INTO ingresos VALUES("1012","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-01-14 22:18:50");
INSERT INTO ingresos VALUES("1013","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-01-14 22:20:07");
INSERT INTO ingresos VALUES("1014","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-01-14 22:34:11");
INSERT INTO ingresos VALUES("1015","41588243","Rocio Abril","Cacciato","LEPAA (LEPAA)","2024-01-20 04:45:22");
INSERT INTO ingresos VALUES("1016","32542188","Gissel","Minicucci","UNION SKATE (USK)","2024-01-20 18:17:51");
INSERT INTO ingresos VALUES("1017","36778262","Ana Carolina","Papoff","EPAC.CB  (EPAC)","2024-01-21 14:04:09");
INSERT INTO ingresos VALUES("1018","39388663","Ayrton","Rueda","NEW BRAND (NWB)","2024-01-22 12:36:35");
INSERT INTO ingresos VALUES("1019","17710827","Norma","Batista","AVE FENIX (AFX)","2024-01-22 22:15:20");
INSERT INTO ingresos VALUES("1020","17710827","Norma","Batista","AVE FENIX (AFX)","2024-01-22 22:16:00");
INSERT INTO ingresos VALUES("1021","17710827","Norma","Batista","AVE FENIX (AFX)","2024-01-22 22:16:56");
INSERT INTO ingresos VALUES("1022","27236262","Maria Fernanda","Torres","CIRCUNVALACION ELITE (CEL)","2024-01-23 01:30:43");
INSERT INTO ingresos VALUES("1023","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-01-23 16:05:01");
INSERT INTO ingresos VALUES("1024","35364631","Marianela","Vitale","CEMEF (CMEF)","2024-01-24 15:05:24");
INSERT INTO ingresos VALUES("1025","41588243","Rocio Abril","Cacciato","LEPAA (LEPAA)","2024-01-24 16:46:19");
INSERT INTO ingresos VALUES("1026","26328130","Romina Bernardette","Carmona","SOUTH SKATE (SSK)","2024-01-27 16:49:03");
INSERT INTO ingresos VALUES("1027","41588243","Rocio Abril","Cacciato","LEPAA (LEPAA)","2024-01-28 17:19:37");
INSERT INTO ingresos VALUES("1028","39388663","Ayrton","Rueda","NEW BRAND (NWB)","2024-01-29 14:04:59");
INSERT INTO ingresos VALUES("1029","26328130","Romina Bernardette","Carmona","SOUTH SKATE (SSK)","2024-01-29 22:05:21");
INSERT INTO ingresos VALUES("1030","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-01-30 00:29:37");
INSERT INTO ingresos VALUES("1031","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-30 00:30:05");
INSERT INTO ingresos VALUES("1032","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-30 00:38:11");
INSERT INTO ingresos VALUES("1033","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-30 18:10:53");
INSERT INTO ingresos VALUES("1034","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-31 00:57:54");
INSERT INTO ingresos VALUES("1035","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-31 11:22:27");
INSERT INTO ingresos VALUES("1036","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-01-31 11:22:44");
INSERT INTO ingresos VALUES("1037","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-31 11:24:50");
INSERT INTO ingresos VALUES("1038","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-31 11:26:08");
INSERT INTO ingresos VALUES("1039","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-31 16:49:41");
INSERT INTO ingresos VALUES("1040","29753800","Barbara","Sudini","APANOVI (APNV)","2024-01-31 17:13:19");
INSERT INTO ingresos VALUES("1041","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-01 01:16:47");
INSERT INTO ingresos VALUES("1042","39171656","Florencia","Pollero","PATIN PUNTUAR (PNTR)","2024-02-01 12:54:55");
INSERT INTO ingresos VALUES("1043","39171656","Florencia","Pollero","PATIN PUNTUAR (PNTR)","2024-02-01 13:20:41");
INSERT INTO ingresos VALUES("1044","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-01 16:31:45");
INSERT INTO ingresos VALUES("1045","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-01 17:03:08");
INSERT INTO ingresos VALUES("1046","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-01 17:10:43");
INSERT INTO ingresos VALUES("1047","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-01 18:02:03");
INSERT INTO ingresos VALUES("1048","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-02 11:10:50");
INSERT INTO ingresos VALUES("1049","251334991","Walter","Iglesias","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-02 11:13:36");
INSERT INTO ingresos VALUES("1050","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-02 11:43:11");
INSERT INTO ingresos VALUES("1051","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-02 12:33:12");
INSERT INTO ingresos VALUES("1052","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-02 12:38:59");
INSERT INTO ingresos VALUES("1053","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-02 12:52:39");
INSERT INTO ingresos VALUES("1054","251334991","Walter","Iglesias","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-02 13:02:02");
INSERT INTO ingresos VALUES("1055","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-02 13:06:41");
INSERT INTO ingresos VALUES("1056","251334991","Walter","Iglesias","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-02 13:18:40");
INSERT INTO ingresos VALUES("1057","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-02 13:29:58");
INSERT INTO ingresos VALUES("1058","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-02 13:33:33");
INSERT INTO ingresos VALUES("1059","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-02 13:41:57");
INSERT INTO ingresos VALUES("1060","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-02 13:56:36");
INSERT INTO ingresos VALUES("1061","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-02 14:37:14");
INSERT INTO ingresos VALUES("1062","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-02 14:55:19");
INSERT INTO ingresos VALUES("1063","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-02 15:03:48");
INSERT INTO ingresos VALUES("1064","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-02 15:10:14");
INSERT INTO ingresos VALUES("1065","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-02 16:24:40");
INSERT INTO ingresos VALUES("1066","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-02 17:22:48");
INSERT INTO ingresos VALUES("1067","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-02 17:24:53");
INSERT INTO ingresos VALUES("1068","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-02 17:35:53");
INSERT INTO ingresos VALUES("1069","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-03 00:00:10");
INSERT INTO ingresos VALUES("1070","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-03 02:46:07");
INSERT INTO ingresos VALUES("1071","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-03 03:32:37");
INSERT INTO ingresos VALUES("1072","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-03 11:08:24");
INSERT INTO ingresos VALUES("1073","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-03 13:29:06");
INSERT INTO ingresos VALUES("1074","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-03 19:04:22");
INSERT INTO ingresos VALUES("1075","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-03 19:07:16");
INSERT INTO ingresos VALUES("1076","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-03 19:07:55");
INSERT INTO ingresos VALUES("1077","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-04 19:33:16");
INSERT INTO ingresos VALUES("1078","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-04 21:44:57");
INSERT INTO ingresos VALUES("1079","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-05 02:48:29");
INSERT INTO ingresos VALUES("1080","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-05 18:09:17");
INSERT INTO ingresos VALUES("1081","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-05 18:15:42");
INSERT INTO ingresos VALUES("1082","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-06 01:02:43");
INSERT INTO ingresos VALUES("1083","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-06 19:08:35");
INSERT INTO ingresos VALUES("1084","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-06 19:36:44");
INSERT INTO ingresos VALUES("1085","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-06 21:33:57");
INSERT INTO ingresos VALUES("1086","39171656","Florencia","Pollero","PATIN PUNTUAR (PNTR)","2024-02-06 22:04:39");
INSERT INTO ingresos VALUES("1087","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-06 23:15:46");
INSERT INTO ingresos VALUES("1088","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-06 23:17:32");
INSERT INTO ingresos VALUES("1089","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-07 01:14:08");
INSERT INTO ingresos VALUES("1090","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-07 01:17:20");
INSERT INTO ingresos VALUES("1091","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-07 11:38:13");
INSERT INTO ingresos VALUES("1092","35364631","Marianela","Vitale","CEMEF (CMEF)","2024-02-07 13:48:58");
INSERT INTO ingresos VALUES("1093","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-07 18:21:03");
INSERT INTO ingresos VALUES("1094","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-07 20:41:47");
INSERT INTO ingresos VALUES("1095","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-07 20:44:08");
INSERT INTO ingresos VALUES("1096","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-07 22:11:22");
INSERT INTO ingresos VALUES("1097","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-07 23:30:08");
INSERT INTO ingresos VALUES("1098","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-08 00:27:48");
INSERT INTO ingresos VALUES("1099","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-08 00:28:36");
INSERT INTO ingresos VALUES("1100","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-08 00:29:46");
INSERT INTO ingresos VALUES("1101","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-08 00:30:15");
INSERT INTO ingresos VALUES("1102","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-08 02:32:13");
INSERT INTO ingresos VALUES("1103","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-08 13:42:45");
INSERT INTO ingresos VALUES("1104","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-08 13:42:45");
INSERT INTO ingresos VALUES("1105","35364631","Marianela","Vitale","CEMEF (CMEF)","2024-02-08 14:18:57");
INSERT INTO ingresos VALUES("1106","36778262","Ana Carolina","Papoff","EPAC.CB  (EPAC)","2024-02-08 14:28:31");
INSERT INTO ingresos VALUES("1107","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-08 17:18:45");
INSERT INTO ingresos VALUES("1108","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-09 03:10:11");
INSERT INTO ingresos VALUES("1109","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-09 03:53:00");
INSERT INTO ingresos VALUES("1110","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-09 03:56:50");
INSERT INTO ingresos VALUES("1111","251334991","Walter","Iglesias","FEDERACION RIOPLATENSE (FPR)","2024-02-09 10:36:06");
INSERT INTO ingresos VALUES("1112","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-09 10:46:15");
INSERT INTO ingresos VALUES("1113","251334991","Walter","Iglesias","FEDERACION RIOPLATENSE (FPR)","2024-02-09 11:10:36");
INSERT INTO ingresos VALUES("1114","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-09 11:49:55");
INSERT INTO ingresos VALUES("1115","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-09 13:28:49");
INSERT INTO ingresos VALUES("1116","36778262","Ana Carolina","Papoff","EPAC.CB  (EPAC)","2024-02-09 14:40:03");
INSERT INTO ingresos VALUES("1117","26328130","Romina Bernardette","Carmona","SOUTH SKATE (SSK)","2024-02-09 14:48:13");
INSERT INTO ingresos VALUES("1118","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-09 16:09:53");
INSERT INTO ingresos VALUES("1119","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-09 17:02:33");
INSERT INTO ingresos VALUES("1120","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-09 17:26:30");
INSERT INTO ingresos VALUES("1121","39587141","Schmidt","Micaela Belen","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-09 17:34:52");
INSERT INTO ingresos VALUES("1122","16607355","Daniel","Figuera","SOC FOM ALIANZA (SFAZ)","2024-02-09 21:56:49");
INSERT INTO ingresos VALUES("1123","16607355","Daniel","Figuera","SOC FOM ALIANZA (SFAZ)","2024-02-09 21:57:36");
INSERT INTO ingresos VALUES("1124","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10 00:42:51");
INSERT INTO ingresos VALUES("1125","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10 00:56:52");
INSERT INTO ingresos VALUES("1126","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-10 02:25:47");
INSERT INTO ingresos VALUES("1127","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10 02:26:55");
INSERT INTO ingresos VALUES("1128","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-10 02:27:12");
INSERT INTO ingresos VALUES("1129","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10 13:05:42");
INSERT INTO ingresos VALUES("1130","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10 13:22:43");
INSERT INTO ingresos VALUES("1131","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10 13:51:08");
INSERT INTO ingresos VALUES("1132","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10 14:07:48");
INSERT INTO ingresos VALUES("1133","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10 14:32:21");
INSERT INTO ingresos VALUES("1134","26328130","Romina Bernardette","Carmona","SOUTH SKATE (SSK)","2024-02-10 20:41:38");
INSERT INTO ingresos VALUES("1135","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-12 02:40:10");
INSERT INTO ingresos VALUES("1136","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-13 01:52:04");
INSERT INTO ingresos VALUES("1137","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-13 12:04:42");
INSERT INTO ingresos VALUES("1138","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-13 14:49:40");
INSERT INTO ingresos VALUES("1139","39587141","Schmidt","Micaela Belen","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-13 16:59:11");
INSERT INTO ingresos VALUES("1140","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-13 18:45:45");
INSERT INTO ingresos VALUES("1141","39587141","Schmidt","Micaela Belen","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-13 20:16:34");
INSERT INTO ingresos VALUES("1142","39587141","Schmidt","Micaela Belen","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-14 00:14:45");
INSERT INTO ingresos VALUES("1143","26328130","Romina Bernardette","Carmona","SOUTH SKATE (SSK)","2024-02-14 02:28:17");
INSERT INTO ingresos VALUES("1144","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-14 11:55:40");
INSERT INTO ingresos VALUES("1145","35364631","Marianela","Vitale","CEMEF (CMEF)","2024-02-14 12:12:52");
INSERT INTO ingresos VALUES("1146","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-14 12:16:10");
INSERT INTO ingresos VALUES("1147","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-14 13:29:44");
INSERT INTO ingresos VALUES("1148","26328130","Romina Bernardette","Carmona","SOUTH SKATE (SSK)","2024-02-14 16:20:15");
INSERT INTO ingresos VALUES("1149","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-14 19:10:56");
INSERT INTO ingresos VALUES("1150","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-14 20:13:54");
INSERT INTO ingresos VALUES("1151","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-14 20:13:57");
INSERT INTO ingresos VALUES("1152","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-14 20:17:11");
INSERT INTO ingresos VALUES("1153","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-14 20:21:02");
INSERT INTO ingresos VALUES("1154","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-14 21:04:43");
INSERT INTO ingresos VALUES("1155","39587141","Schmidt","Micaela Belen","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-14 21:25:47");
INSERT INTO ingresos VALUES("1156","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-14 21:35:26");
INSERT INTO ingresos VALUES("1157","251334991","Walter","Iglesias","FEDERACION RIOPLATENSE (FPR)","2024-02-14 21:54:10");
INSERT INTO ingresos VALUES("1158","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-14 22:33:49");
INSERT INTO ingresos VALUES("1159","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-14 22:41:10");
INSERT INTO ingresos VALUES("1160","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-15 00:42:00");
INSERT INTO ingresos VALUES("1161","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15 00:49:26");
INSERT INTO ingresos VALUES("1162","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15 01:16:58");
INSERT INTO ingresos VALUES("1163","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-15 01:23:47");
INSERT INTO ingresos VALUES("1164","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-15 11:40:08");
INSERT INTO ingresos VALUES("1165","35364631","Marianela","Vitale","CEMEF (CMEF)","2024-02-15 11:58:05");
INSERT INTO ingresos VALUES("1166","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-15 13:00:32");
INSERT INTO ingresos VALUES("1167","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-15 17:00:49");
INSERT INTO ingresos VALUES("1168","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-15 17:30:07");
INSERT INTO ingresos VALUES("1169","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-15 18:06:03");
INSERT INTO ingresos VALUES("1170","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-15 19:21:13");
INSERT INTO ingresos VALUES("1171","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-15 20:06:19");
INSERT INTO ingresos VALUES("1172","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15 21:08:28");
INSERT INTO ingresos VALUES("1173","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-15 21:12:00");
INSERT INTO ingresos VALUES("1174","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-15 21:44:08");
INSERT INTO ingresos VALUES("1175","251334991","Walter","Iglesias","FEDERACION RIOPLATENSE (FPR)","2024-02-15 21:46:32");
INSERT INTO ingresos VALUES("1176","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-15 22:05:37");
INSERT INTO ingresos VALUES("1177","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-15 23:08:42");
INSERT INTO ingresos VALUES("1178","26328130","Romina Bernardette","Carmona","SOUTH SKATE (SSK)","2024-02-16 00:11:40");
INSERT INTO ingresos VALUES("1179","39587141","Schmidt","Micaela Belen","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-16 00:52:02");
INSERT INTO ingresos VALUES("1180","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-16 01:11:13");
INSERT INTO ingresos VALUES("1181","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-16 01:50:00");
INSERT INTO ingresos VALUES("1182","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-16 14:38:51");
INSERT INTO ingresos VALUES("1183","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-16 15:45:06");
INSERT INTO ingresos VALUES("1184","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16 16:41:36");
INSERT INTO ingresos VALUES("1185","26328130","Romina Bernardette","Carmona","SOUTH SKATE (SSK)","2024-02-16 18:17:23");
INSERT INTO ingresos VALUES("1186","39171656","Florencia","Pollero","PATIN PUNTUAR (PNTR)","2024-02-16 19:17:28");
INSERT INTO ingresos VALUES("1187","39171656","Florencia","Pollero","PATIN PUNTUAR (PNTR)","2024-02-16 19:26:07");
INSERT INTO ingresos VALUES("1188","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16 19:32:11");
INSERT INTO ingresos VALUES("1189","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16 19:33:54");
INSERT INTO ingresos VALUES("1190","36778262","Ana Carolina","Papoff","EPAC.CB  (EPAC)","2024-02-16 19:44:35");
INSERT INTO ingresos VALUES("1191","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16 20:04:06");
INSERT INTO ingresos VALUES("1192","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16 20:38:28");
INSERT INTO ingresos VALUES("1193","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-16 21:33:35");
INSERT INTO ingresos VALUES("1194","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16 21:52:14");
INSERT INTO ingresos VALUES("1195","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16 21:56:49");
INSERT INTO ingresos VALUES("1196","23208053","Greta Cloe","Cantarelli","DEFENSORES DE CAMBACERES (CBCR)","2024-02-16 23:47:08");
INSERT INTO ingresos VALUES("1197","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16 23:47:59");
INSERT INTO ingresos VALUES("1198","23208053","Greta Cloe","Cantarelli","DEFENSORES DE CAMBACERES (CBCR)","2024-02-16 23:50:28");
INSERT INTO ingresos VALUES("1199","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17 02:30:24");
INSERT INTO ingresos VALUES("1200","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17 02:56:09");
INSERT INTO ingresos VALUES("1201","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17 03:04:43");
INSERT INTO ingresos VALUES("1202","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-17 13:39:02");
INSERT INTO ingresos VALUES("1203","23208053","Greta Cloe","Cantarelli","DEFENSORES DE CAMBACERES (CBCR)","2024-02-17 19:55:48");
INSERT INTO ingresos VALUES("1204","23208053","Greta Cloe","Cantarelli","DEFENSORES DE CAMBACERES (CBCR)","2024-02-17 19:56:43");
INSERT INTO ingresos VALUES("1205","23208053","Greta Cloe","Cantarelli","DEFENSORES DE CAMBACERES (CBCR)","2024-02-17 20:25:58");
INSERT INTO ingresos VALUES("1206","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-17 21:10:49");
INSERT INTO ingresos VALUES("1207","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-18 12:23:12");
INSERT INTO ingresos VALUES("1208","41588243","Rocio Abril","Cacciato","LEPAA (LEPAA)","2024-02-18 12:32:19");
INSERT INTO ingresos VALUES("1209","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-18 12:33:19");
INSERT INTO ingresos VALUES("1210","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-18 17:05:33");
INSERT INTO ingresos VALUES("1211","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-18 17:19:40");
INSERT INTO ingresos VALUES("1212","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-18 20:03:06");
INSERT INTO ingresos VALUES("1213","39587141","Schmidt","Micaela Belen","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-18 20:41:51");
INSERT INTO ingresos VALUES("1214","23208053","Greta Cloe","Cantarelli","DEFENSORES DE CAMBACERES (CBCR)","2024-02-19 03:09:56");
INSERT INTO ingresos VALUES("1215","39587141","Schmidt","Micaela Belen","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-19 04:20:26");
INSERT INTO ingresos VALUES("1216","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-19 10:40:26");
INSERT INTO ingresos VALUES("1217","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-19 11:33:26");
INSERT INTO ingresos VALUES("1218","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-19 15:57:45");
INSERT INTO ingresos VALUES("1219","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-19 16:18:32");
INSERT INTO ingresos VALUES("1220","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-19 17:59:37");
INSERT INTO ingresos VALUES("1221","31776870","Leila Jael","Vanzulli","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-19 20:22:39");
INSERT INTO ingresos VALUES("1222","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-20 00:02:12");
INSERT INTO ingresos VALUES("1223","39587141","Schmidt","Micaela Belen","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-20 02:26:06");
INSERT INTO ingresos VALUES("1224","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-20 04:01:40");
INSERT INTO ingresos VALUES("1225","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-20 12:34:41");
INSERT INTO ingresos VALUES("1226","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-20 12:46:35");
INSERT INTO ingresos VALUES("1227","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-20 15:06:48");
INSERT INTO ingresos VALUES("1228","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-20 22:16:14");
INSERT INTO ingresos VALUES("1229","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-20 23:24:47");
INSERT INTO ingresos VALUES("1230","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-21 00:12:25");
INSERT INTO ingresos VALUES("1231","41588243","Rocio Abril","Cacciato","LEPAA (LEPAA)","2024-02-21 14:11:29");
INSERT INTO ingresos VALUES("1232","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-21 14:13:17");
INSERT INTO ingresos VALUES("1233","41588243","Rocio Abril","Cacciato","LEPAA (LEPAA)","2024-02-21 14:19:04");
INSERT INTO ingresos VALUES("1234","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-21 14:24:32");
INSERT INTO ingresos VALUES("1235","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-21 17:33:11");
INSERT INTO ingresos VALUES("1236","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-21 18:40:35");
INSERT INTO ingresos VALUES("1237","41588243","Rocio Abril","Cacciato","LEPAA (LEPAA)","2024-02-21 18:43:15");
INSERT INTO ingresos VALUES("1238","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-21 18:45:41");
INSERT INTO ingresos VALUES("1239","41588243","Rocio Abril","Cacciato","LEPAA (LEPAA)","2024-02-21 18:58:55");
INSERT INTO ingresos VALUES("1240","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-21 19:00:09");
INSERT INTO ingresos VALUES("1241","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-21 19:27:42");
INSERT INTO ingresos VALUES("1242","26328130","Romina Bernardette","Carmona","SOUTH SKATE (SSK)","2024-02-21 22:54:52");
INSERT INTO ingresos VALUES("1243","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22 00:25:41");
INSERT INTO ingresos VALUES("1244","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22 02:38:12");
INSERT INTO ingresos VALUES("1245","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22 03:40:14");
INSERT INTO ingresos VALUES("1246","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22 03:41:49");
INSERT INTO ingresos VALUES("1247","39587141","Schmidt","Micaela Belen","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-22 05:05:59");
INSERT INTO ingresos VALUES("1248","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-22 13:49:05");
INSERT INTO ingresos VALUES("1249","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-22 14:01:38");
INSERT INTO ingresos VALUES("1250","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22 16:06:00");
INSERT INTO ingresos VALUES("1251","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-22 20:12:26");
INSERT INTO ingresos VALUES("1252","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22 23:56:40");
INSERT INTO ingresos VALUES("1253","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-22 23:57:18");
INSERT INTO ingresos VALUES("1254","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-23 01:56:27");
INSERT INTO ingresos VALUES("1255","26328130","Romina Bernardette","Carmona","SOUTH SKATE (SSK)","2024-02-23 04:45:09");
INSERT INTO ingresos VALUES("1256","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-23 13:45:20");
INSERT INTO ingresos VALUES("1257","35364631","Marianela","Vitale","CEMEF (CMEF)","2024-02-23 15:07:50");
INSERT INTO ingresos VALUES("1258","29753800","Barbara","Sudini","APANOVI (APNV)","2024-02-23 21:44:39");
INSERT INTO ingresos VALUES("1259","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-23 22:34:55");
INSERT INTO ingresos VALUES("1260","39171656","Florencia","Pollero","PATIN PUNTUAR (PNTR)","2024-02-23 23:54:05");
INSERT INTO ingresos VALUES("1261","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-24 01:47:06");
INSERT INTO ingresos VALUES("1262","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-24 02:09:34");
INSERT INTO ingresos VALUES("1263","23192306","Karina Alejandra","Ceballos","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-24 17:00:21");
INSERT INTO ingresos VALUES("1264","39587141","Schmidt","Micaela Belen","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-25 01:48:51");
INSERT INTO ingresos VALUES("1265","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-25 02:58:45");
INSERT INTO ingresos VALUES("1266","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-25 03:01:13");
INSERT INTO ingresos VALUES("1267","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-25 10:53:37");
INSERT INTO ingresos VALUES("1268","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-25 11:10:01");
INSERT INTO ingresos VALUES("1269","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-27 15:54:35");
INSERT INTO ingresos VALUES("1270","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-27 15:56:33");
INSERT INTO ingresos VALUES("1271","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-27 15:57:32");
INSERT INTO ingresos VALUES("1272","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-27 15:58:02");
INSERT INTO ingresos VALUES("1273","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-27 18:33:36");
INSERT INTO ingresos VALUES("1274","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-29 10:24:45");
INSERT INTO ingresos VALUES("1275","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-29 10:26:06");
INSERT INTO ingresos VALUES("1276","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-29 10:42:12");
INSERT INTO ingresos VALUES("1277","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-29 10:48:26");
INSERT INTO ingresos VALUES("1278","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-29 10:50:47");
INSERT INTO ingresos VALUES("1279","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-29 10:52:08");
INSERT INTO ingresos VALUES("1280","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-29 16:07:16");
INSERT INTO ingresos VALUES("1281","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-29 22:31:14");
INSERT INTO ingresos VALUES("1282","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-03-01 22:34:58");
INSERT INTO ingresos VALUES("1283","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-03-03 22:18:22");



DROP TABLE IF EXISTS patinadores;

CREATE TABLE `patinadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dnipatinador` bigint(20) NOT NULL,
  `fechanacpatinador` date NOT NULL,
  `nombrepatinador` varchar(100) COLLATE utf8_bin NOT NULL,
  `apellidopatinador` varchar(100) COLLATE utf8_bin NOT NULL,
  `sexopatinador` varchar(20) COLLATE utf8_bin NOT NULL,
  `tipolicencia` varchar(50) COLLATE utf8_bin NOT NULL,
  `emailpatinador` varchar(255) COLLATE utf8_bin NOT NULL,
  `telefonopatinador` varchar(50) COLLATE utf8_bin NOT NULL,
  `domiciliopatinador` varchar(255) COLLATE utf8_bin NOT NULL,
  `nacionalidadpatinador` varchar(100) COLLATE utf8_bin NOT NULL,
  `provinciapatinador` varchar(100) COLLATE utf8_bin NOT NULL,
  `localidadpatinador` varchar(50) COLLATE utf8_bin NOT NULL,
  `cppatinador` varchar(50) COLLATE utf8_bin NOT NULL,
  `funcionpatinador` varchar(100) COLLATE utf8_bin NOT NULL,
  `partidopatinador` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `valorLicencia` bigint(100) DEFAULT NULL,
  `pagoLicencia` bigint(100) DEFAULT NULL,
  `nombrepadre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dnipadre` int(20) DEFAULT NULL,
  `nombremadre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dnimadre` int(20) DEFAULT NULL,
  `cuit` bigint(20) DEFAULT NULL,
  `estadocap` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `estadoseguro` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`dnipatinador`),
  KEY `id` (`id`),
  KEY `cuit` (`cuit`),
  CONSTRAINT `patinadores_ibfk_1` FOREIGN KEY (`cuit`) REFERENCES `clubs` (`cuit`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1270 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO patinadores VALUES("1268","444","2010-01-01","Pablo G","Donato","M","NACIONAL","pablodonatoportfolio@gmail.com","","Eduaro Costa 120","Argentina","Soltero/a","LOMAS DEL MIRADOR","1752","Patinador","La Matanza","50000","","Juan Palotes","0","Teodora Gonzales","0","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-27","","","","","","");
INSERT INTO patinadores VALUES("1036","33435474","1988-02-28","Florencia","Pereyra","F","RUD","","1138432172","Salcedo 3211","Argentina","Buenos Aires","CABA","1200","Patinadora","Caba","15000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1232","38522400","2008-03-07","Guadalupe","Lopez","F","NACIONAL","carolabnavarro@gmail.com","1151100116","Nazca 3143","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1416","Patinadora","Ciudad De Buenos Aires","50000","0","Mariano Lopez","0","Carolina Navarro","0","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1188","40227211","1997-04-13","Luciano","Prieto","M","NACIONAL","","1133360284","Primera Junta 1120","Argentino","Buenos Aires","LA MATANZA ","1768","Patinador","La Matanza","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1227","41588243","1999-03-02","Rocio Abril","Cacciato","F","NACIONAL","","1149485785","Amadeo Jacques 7020 Torre 1 1a","Argentina","Caba","CABA","1408","Patinadora","Caba","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20");
INSERT INTO patinadores VALUES("1231","41904162","1976-06-28","Tomas","Masia","M","CAP INVITADOS","walteriglesias11@gmail.com","0111540817796","Carlos Gardel 572","Argentina","Buenos Aires","AVELLANEDA","1870","Patinador","Lanus","0","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16");
INSERT INTO patinadores VALUES("1233","42201617","1999-10-15","Grecia","Aquino","F","NACIONAL","greciaaquino99@gmail.com","1165392766","A. Italia 207","Argentina","Buenos Aires","TIGRE","1648","Patinadora","Tigre","50000","0","","0","","0","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1035","42428828","2000-02-24","Camila","Coscarelli","F","NACIONAL","","02215232968","92 Y 37 Lote 299","Argentina","Buenos Aires","LA PLATA","1900","Patinadora","La Plata","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1228","42575612","1999-04-27","Melisa","Norro","F","NACIONAL","","2235677425","Azopardo 2190","Argentina","Buenos Aires","RAFAEL CALZADA","1847","Patinadora","Rafael Calzada","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1176","42874079","2000-08-25","Gianella","Gianuzzi","F","NACIONAL","","1154995709","Yerbal 642","Argentina","Caba","CABA","1405","Patinadora","Caba","50000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1199","43101629","2001-03-14","Lucas","Repetto","M","NACIONAL","","1171501662","Congreso 1996 P1 D6","Argentino","Caba","BELGRANO","1428","Patinador","Caba","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1206","43599600","2001-09-03","Florencia Ayelen","Barcelo","F","NACIONAL","","47201622","Las Acacias 637","Argentina","Buenos Aires","ING. MASCHWITZ","1623","Patinadora","Escobar","50000","0","Juan Carlos Barceló","8495116","María Fernanda Correa","17500787","10018","Pendiente","Pendiente","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1234","43839815","2009-10-08","Uma ","Sepliarsky","F","NACIONAL","nacevey@gmail.com","1130755916","Gral. B Victorica 2549","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1431","Patinadora","Ciudad De Buenos Aires","50000","0","Pablo Ariel Sepliarsky","28395862","Nadia Acevey","27915924","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1205","43860264","2002-01-08","Catalina Ines","Figueroa","F","NACIONAL","","02214887490","85 Bis E/ 115 Y 116 Nro 210 \"j\"","Argentina","Buenos Aires","LA PLATA","1900","Patinadora","La Plata","50000","0","","0","","0","10011","Pendiente","Pendiente","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1223","44379680","2002-09-27","Nadia","Guzman","F","NACIONAL","","","Larioja 3755","Argentina","Buenos Aires","QUILMES","1879","Patinadora","Quilmes","50000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1192","44491718","2002-09-05","Martina","Della Chiesa","F","NACIONAL","","1533983086","Lorenzo A Guarracino 2469","Argentina","Buenos Aires","REMEDIOS DE ESCALADA","1824","Patinadora","Lanus","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1169","44670473","2003-02-25","Agostina","Criso Tamanini","F","NACIONAL","","1151386579","Gral. Madariaga 179","Argentina","Buenos Aires","LANUS","1824","Patinadora","Lanus","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1126","44969164","2003-06-11","María Josefina","Delgado","F","NACIONAL","","1123123732","Las Piedras 2122","Argentina","Buenos Aires","LANUS","1824","Patinadora","Lanus","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1230","45298324","2003-10-30","Athina","Pino","F","NACIONAL","","1155076086","Benitez Perez Galdos 2868","Argentina","Buenos Aires","QUILMES","1879","Patinadora","Quilmes","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1134","45597415","2012-01-26","Monserrath ","Velazquez Valdez","F","PROMOCIONAL","","1161431137","Carlone 9951","Paraguaya","Bs As","SAN MARTIN","1650","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-14");
INSERT INTO patinadores VALUES("1186","45679359","2004-04-04","Agustina","Garcia Bernardini","F","NACIONAL","","1531903472","Segurola 1416","Argentina","Buenos Aires","LANúS","1824","Patinadora","Lanús","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1235","45753675","2004-06-09","Micaela ","Fernández Urroz","F","NACIONAL","micaelafernandezurroz@gmail.com","1162100707"," Boyacá 1446","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1416","Patinadora","Ciudad De Buenos Aires","50000","0","","0","","0","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1135","45992257","2004-09-25","Lucia Celeste","Yañez","F","NACIONAL","","1169835245","Calle B 257","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","50000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1202","46027137","2004-08-05","Abril Micaela","Orozco","F","NACIONAL","abrilorozcorodriguez@gmail.com","1135976206","Ceretti 2792","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1428","Patinadora","Ciudad De Buenos Aires","50000","0","","0","Ana Julia Rodriguez","30276304","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1136","46197445","2004-12-05","Carola Guadalupe","Carbonell","F","NACIONAL","","1152598413","Boulogne Sur Mer 285","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","50000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1165","46209554","2004-11-11","Lenny","Ledesma","M","NACIONAL","","1133436150","San Lorenzo 3441","Argentino","Buenos Aires","LONGCHAMPS","1854","Patinador","Longchamps","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1191","46272949","2004-12-20","Lucia","Susundey","F","NACIONAL","","46272949","Paso De Burgos 1959","Argentina","Buenos Aires","AVELLANEDA","1870","Patinadora","Avellaneda","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1046","46292470","2005-03-10","Valentina","Alignani","F","NACIONAL","","1159965403","Lote 2  I06 Barrio Quilmes","Argentina","Buenos Aires","QUILMES","1876","Patinadora","Quilmes","50000","0","","0","","0","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1189","46499243","2005-02-01","Carolina","Rodriguez","F","NACIONAL","","1159088899","Velloso 3553","Argentina","Buenos Aires","REMEDIOS DE ESCALADA","1826","Patinadora","Lanus","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1033","46759079","2005-08-02","Camila Soledad","Gomez Costado","F","NACIONAL","","1125694984","Esqui 1334","Argentina","Caba","CABA","1437","Patinadora","Caba","50000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-01","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1194","46874537","2005-09-30","Martina","Roselli","F","NACIONAL","","1128778290","Boedo 1341","Argentina","Buenos Aires","LOMAS DE ZAMORA","1832","Patinadora","Lomas De Zamora","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1167","47058040","2005-11-09","Julieta","Vincent Desoindre","F","NACIONAL","","11387347772","El Zorzal 1604","Argentina","Buenos Aires","TEMPERLEY","1834","Patinadora","Temperley","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1127","47114486","2006-02-07","Giuliana Luz","Scamarda","F","NACIONAL","","1137628940","Lavalle 173","Argentina","Buenos Aires","BERNAL","1876","Patinadora","Avellaneda","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1207","47166273","2006-07-18","Tatiana Belén","Godoy Escobar","F","NACIONAL","patinpuntuar@gmail.com","1162553905","Alpatacal 3350","Argentina","Buenos Aires","SANTOS LUGARES","1676","Patinadora","3 De Febrero","50000","0","Jose Godoy","34114244","Fatima Escobar","34829386","10018","Pendiente","Pendiente","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16");
INSERT INTO patinadores VALUES("1137","47172065","2006-07-03","Nahiara Yasmin","Tello","F","PROMOCIONAL","","1171332350","Urquiza 5828","Argentina","Bs As","VILLA BALLESTER","1653","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1138","47214927","2006-03-20","Melanie","Gonzalez","F","NACIONAL","","1134958046","Belgrano 6186","Argentina","Bs As","LOMA HERMOSA","1657","Patinadora","San Martin","50000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1128","47260953","2006-04-12","Nahir","Maidana","F","NACIONAL","","1157103533","Juan Ruiz De Ocaña 3653","Argentina","Buenos Aires","LANUS","1824","Patinadora","Lanus","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1224","47295389","2006-10-18","Martina","Lopez Rabino","F","PROMOCIONAL","","","Gallegos 3443","Argentina","Caba","CABA","1240","Patinadora","Caba","45000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16");
INSERT INTO patinadores VALUES("1038","47346955","2006-08-31","Greta Paulette","Troncoso","F","NACIONAL","","1137852978","Chivilcoy 560","Argentina","Buenos Aires","AVELLANEDA","1874","Patinadora","Avellaneda","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1123","47387302","2006-05-18","Valentina","Zuccarelli","F","NACIONAL","","1123523162","Paramaribo 4124","Argentina","Buenos Aires","MORENO","1746","Patinadora","Francisco Alvarez","50000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1139","47395749","2006-05-31","Bianca Muriel","Paglione","F","NACIONAL","","1134184640","Colonia 2952","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","50000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1140","47419025","2006-06-16","Evelin ","Benitez","F","NACIONAL","","1163685917","Los Olivos 7804","Argentina","Bs As","LOMA HERMOSA","1657","Patinadora","San Martin","50000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1180","47432952","2006-11-17","Bianca","Huerga","F","NACIONAL","","1164022777","Av. Independencia 2095","Argentina","Buenos Aires","CABA","1225","Patinadora","Caba","50000","0","Sergio J. Huerga","18205505","Sandra L Perales","18283033","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1141","47480865","2006-09-26","Luana Ailin","Leguizamon","F","NACIONAL","","1134336525","Artigas 5820","Argentina","Bs As","CHILAVERT","1653","Patinadora","San Martin","50000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1032","47574680","2004-12-26","Delfina","Mango","F","NACIONAL","","1121618427","Urquiza 1062","Argentina","Caba","CABA","1221","Patinadora","Caba","50000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-01","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1263","47634056","2006-10-10","Catalina Ambar","Banegas","F","NACIONAL","sabinacary.sb@gmail.com","2215312991","29 Nº 572","Argentina","Buenos Aires","BERISSO","1923","Patinadora","Berisso","50000","0","","0","Carina Paola Basal","22404303","10006","Pendiente","Pendiente","23208053","Greta Cloe","Cantarelli","10006","DEFENSORES DE CAMBACERES (CBCR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1174","47654256","2006-12-27","Valentina","Selan","F","NACIONAL","vero_ceberio@yahoo.com.ar","1166835896","Paysandu 1343 Pb 2","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1416","Patinadora","Ciudad De Buenos Aires","50000","0","Gabriel José Selan","25983702","Verónica Alejandra Ceberio","28111565","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1195","47700865","2007-03-01","Victoria Ailín ","Caceres","F","NACIONAL","goneuge@yahoo.com.ar","1130805295"," Cramer 355 7° 1","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1426","Patinadora","Ciudad De Buenos Aires","50000","0","Cáceres Ezequiel Gustavo","21838665","González María Eugenia","18125665","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1100","47708194","2008-05-17","Ludmila Aylen","Vilariño","F","NACIONAL","","1559422795","Calle 846 Numero 2645","Argentina","Buenos Aires","SOLANO","1881","Patinadora","Solano","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1113","47747598","2007-02-14","Alexia Milena","Ferro","F","NACIONAL","","47408077","Gral Pacheco 2500","Argentina","Buenos Aires","EL TALAR","1617","Patinadora","La Plata","50000","0","Ferro Oscar Salvador","17867262","Castro Jorgelina Andrea","25913827","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1171","47756056","2007-03-03","Ximena","Virgilio","F","NACIONAL","","1133069580","Liniers 395","Argentina","Buenos Aires","LANUS","1824","Patinadora","Lanus","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1050","47756437","2007-04-04","Renata","Tescari","F","NACIONAL","","1140764724","Raul Alfonsin 1266 Dto. B","Argentina","Buenos Aires","LANUS ESTE","1824","Patinadora","Lanus","50000","0","","0","","0","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1105","47790595","2007-02-27","Victoria","Carabajal","F","NACIONAL","","1557185051","Santa Isabel 425","Argentina","Buenos Aires","LOMAS DE ZAMORA","1832","Patinadora","Lomas De Zamora","50000","0","","0","Olmedo Laura","60893518","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09");
INSERT INTO patinadores VALUES("1104","47794592","2007-06-05","Ulises","Loiseau Büchele","M","NACIONAL","","2216712411","Cantilo Nro 477","Argentina","Buenos Aires","CITY BELL","1896","Patinador","La Plata","50000","0","Carlos Marcelo Loiseau","17588992","Adriana Paula Büchele","21463515","10011","Pendiente","Pendiente","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1236","47872343","2007-08-14","Lucia Florencia","Eppel","F","NACIONAL","ericahaase@gmail.com","1154140303","Av Diaz Velez 5469 7 A ","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1405","Patinadora","Ciudad De Buenos Aires","50000","0","Eppel","23250373","Erica Haase","21831210","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1215","47872480","2007-08-07","Valentina","Lauria","F","NACIONAL","polorocco@hotmail.com","1561120724","Aconcagua 2109","Argentina","Buenos Aires","HURLINGHAM","1686","Patinadora","Hurlingham","50000","0","Gustavo Lauria","18326202","Karina Lazo","20762642","10024","Pendiente","Pendiente","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1219","47962168","2007-07-10","Maia Guadalupe","Barallobre","F","NACIONAL","","1151504370","Quito 4028","Argentina","Caba","CABA","1212","Patinadora","Caba","50000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1200","48058771","2007-04-07","Brisa Nahir","Taraborelli","F","NACIONAL","","1124568304","Villanueva 3621","Argentina","Buenos Aires","QUILMES","1879","Patinadora","Quilmes","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1101","48159819","2007-05-16","Victoria","Massimino","F","NACIONAL","","1165959988","Sande 120","Argentina","Buenos Aires","AVELLANEDA","1870","Patinadora","Avellaneda","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1237","48183968","2007-11-05","Maia Catalina","Rubio","F","NACIONAL","Aburgosdg@yahoo.com","1145505215","Neuquen 2945","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1406","Patinadora","Ciudad De Buenos Aires","50000","0","Ramiro Rubio","25142580","Andrea Burgos","24110515","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1238","48240628","2007-10-01","Pilar","Ovejero","F","NACIONAL","rparias@gmail.com","1130136563","Av. Boedo 1318 Piso 5","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1239","Patinadora","Ciudad De Buenos Aires","50000","0","Rodrigo Parias Nucci","92832289","Marisa Alejandra Miguel","25769518","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1142","48308589","2007-11-05","Kiara Sofia","Herrera Gimenez","F","PROMOCIONAL","","1137571940","Corrientes 3722","Argentina","Bs As","SAN MARTIN","1650","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1047","48373995","2007-10-16","Morena Araceli","Coduri","F","NACIONAL","","1137017902","Amancio Alcorta 4049","Argentina","Buenos Aires","CLAYPOLE","1849","Patinadora","Almirante Brown","50000","0","","0","","0","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1179","48384181","2007-12-07","Paloma Rocio","Cymbernop Garcia","F","NACIONAL","palocymber@gmail.com","1159306465","Teniente Gral Peron 2220","Argentina","Buenos Aires","CABA","1040","Patinadora","Caba","50000","0","Leandro Javier Cymbernop","25612601","Maria Raquel Garcia","25288678","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1222","48390010","2008-01-28","Agustina Erika","Gil","F","NACIONAL","","","Andres Lamas 1053","Argentina","Caba","CABA","1406","Patinadora","Caba","50000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1214","48390271","2008-03-01","Morena","Ardila Quintana","F","NACIONAL","loreq2001@hotmail.com","1133115993","La Calandria 870","Argentina","Buenos Aires","VILLA ADELINA","1607","Patinadora","San Isidro","50000","0","Carlos Rubén Ardila","23075405","Maria Lorena Quintana","24756464","10024","Pendiente","Pendiente","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16");
INSERT INTO patinadores VALUES("1065","48508548","2008-03-13","Morena","Barrios Canay","F","NACIONAL","","1132748643","Pasaje Padilla 553 ","Argentina","Buenos Aires","LANUS ESTE","1824","Patinadora","Lanus","50000","0","","0","","0","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1045","48519922","2008-06-18","Sofia","Alignani","F","PROMOCIONAL","","11599965403","Lote 2 I06 Barrio Quilmes","Argentina","Buenos Aires","QUILMES","1876","Patinadora","Quilmes","45000","0","","0","","0","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1198","48520656","2008-02-02","Bianca Isabella","Muller","F","NACIONAL","casibruja.sas@gmail.com","1154630203","Amenabar 1247 8vo. 15","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1247","Patinadora","Ciudad De Buenos Aires","50000","0","Mauro Matías Müller","31326745"," María Romina Natalia Rios","29393640","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1133","48520755","2008-02-06","Brisa","Correa Sosa","F","NACIONAL","","1149713250","Tte Rangugni 3911","Argentina","Buenos Aires","LANUS","1826","Patinadora","Lanus","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1122","48567040","2008-02-04","Candela Morena","Buze","F","NACIONAL","","02215911509","462 Nro 2329","Argentina","Buenos Aires","J.M. GUTIERREZ","1890","Patinadora","Berazategui","50000","0","Nicolas Buze","35952476","Karen Molina","39159487","10011","Pendiente","Pendiente","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-13","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1229","48574193","2008-05-23","Emilia Azul","Piedrabuena","F","NACIONAL","","1534351504","Merlo 172","Argentina","Buenos Aires","LOMAS DE ZAMORA","1832","Patinadora","Lomas De Zamora","50000","0","","0","Piedrabuena Vanina Jesica ","33536786","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-16","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-16");
INSERT INTO patinadores VALUES("1193","48584419","2008-02-05","Celeste","Poggio Lado","F","NACIONAL","","1120199237","Emilio Castro 3275","Argentina","Buenos Aires","LANúS","1824","Patinadora","Lanús","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1170","48651161","2008-08-14","Alma","Villalba","F","NACIONAL","","1132680238","Gaebeler 746","Argentina","Buenos Aires","LANUS","1824","Patinadora","Lanus","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1119","48661501","2008-06-05","Justina","Carneirinho","F","NACIONAL","","2213576064","135 Esq 417","Argentina","Buenos Aires","VILLA ELISA","1894","Patinadora","Laplata","50000","0","Fabian Carneirinho","21519042","Karina Affonso","23017373","10011","Pendiente","Pendiente","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-10","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1239","48796476","2008-07-15","Luciana","Roma","F","NACIONAL","Paulaconsi@hotmail.com","1130159955","Giribone 3257","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1431","Patinadora","Ciudad De Buenos Aires","50000","0","Juan Manuel Roma ","26114449","Paula Hebe Consigliere","29972694","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1217","48796768","2008-07-01","Morena","Martínez Romero","F","NACIONAL","alevaneromero@gmail.com","1160520108","Barbosa 945","Argentina","Buenos Aires","MORóN ","1708","Patinadora","Moron","50000","0","Alejandro Gabriel Martínez Lujan","31652936","Alejandra Vanesa Romero","31776506","10024","Pendiente","Pendiente","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-08","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-09");
INSERT INTO patinadores VALUES("1143","48836442","2008-08-19","Nahiara Abril","Gerez","F","NACIONAL","","1128623850","Calle B 8533","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","50000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1144","48836453","2008-08-09","Brenda Geraldine","Segobia Gauna","F","PROMOCIONAL","","1170856025","Sarandi 5376","Argentina","Bs As","VILLA BALLESTER","1653","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1145","48836498","2008-09-05","Gaia","Ibañez","F","NACIONAL","","1168816778","Calcagno 3549","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","50000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1037","48848775","2008-08-22","Morena","Basile","F","NACIONAL","","1141963338","Juncal 3167","Argentina","Buenos Aires","LANUS ESTE","1824","Patinadora","Lanús","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1146","48992043","2008-09-11","Rocio Belen","Ganske","F","PROMOCIONAL","","","1ro De Agosto 7167","Argentina","Bs As","SAN MARTIN","1657","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1147","49000144","2009-10-11","Tiara ","Grando Benitez","F","PROMOCIONAL","","1124804207","Parana 6265","Argentina","Bs As","SAN MARTIN","1657","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1181","49004312","2008-08-29","Carolina Grisel","Nicora Martin","F","NACIONAL","kimeycolo@gamail.com","1565182083","Agrelo 3410","Argentina","Buenos Aires","CABA","1224","Patinadora","Caba","50000","0","Gabriel Adrian Nicora","27687784","Karina Grissel Martin ","190038855","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1175","49006505","2008-10-07","Sofia ","Caldano Kraft","F","NACIONAL","Lorekraft@hotmail.com","1165139475","Pedro Moran 2617","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1419","Patinadora","Ciudad De Buenos Aires","50000","0","Gabriel Sebastián Caldano","27285739","Lorena Kraft","26488883","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1208","49008377","2008-11-22","Guadalupe","Procacci","F","NACIONAL","patinpuntuar@gmail.com","1150969828","Nuñez 2395","Argentina","Caba","CABA","1417","Patinadora","Caba","50000","0","","0","Natalia Noya","31727011","10018","Pendiente","Pendiente","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1213","49086992","2008-10-27","Faustina Lis","Aquino","F","NACIONAL","faustinaaquino5@gmail.com","1127999752","Amoroso 473","Argentina","Buenos Aires","HURLINGHAM","1686","Patinadora","Hurlingham","50000","0","Favio Andres Aquino","18374570","Nancy Viviana Caruso","17922675","10024","Pendiente","Pendiente","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1240","49185271","2008-12-29","Maria Belen","Cichello","F","NACIONAL","","1166676869","Baunes 2125 Piso 1 Dpto. 3","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1431","Patinadora","Ciudad De Buenos Aires","50000","0","Carlos Fernando Cichello Quiros","18560046","Carmen Marcela Alvarez Favale","24127072","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1039","49238102","2009-03-16","Valentina","Gallego","F","NACIONAL","","1155912445","49 Nº 3138d","Argentina","Buenos Aires","BERAZATEGUI","1885","Patinadora","Berazategui","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1241","49255704","2008-08-26","Angeles Abril ","Sotelo Vasconcel ","F","NACIONAL","","1133189234","Darregueyra 2307","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1425","Patinadora","Ciudad De Buenos Aires","50000","0","","0","Elizabeth Vasconcel","25024710","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1242","49332899","2009-03-11","Lara","La Fontaine","F","NACIONAL","loreleybenitez@gmail.com","1151616548","Av. Corro 457","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1407","Patinadora","Ciudad De Buenos Aires","50000","0","Gustavo Adolfo Antonio La Fontaine","23969322","Loreley Noelia Benitez","24905263","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1209","49380115","2009-02-25","Valentina","Gottfried","F","NACIONAL","patinpuntuar@gmail.com","1551801036","Heredia 619","Argentina","Buenos Aires","VILLA LYNCH","1672","Patinadora","San Martín","50000","0","Brian Gottfried","25966281","Alejandra Rodríguez","25687971","10018","Pendiente","Pendiente","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1267","49550939","2009-06-23","Florencia","Come","F","NACIONAL","florenciacome23@gmail.com","1153789739","Arenales 1669","Argentina","Buenos Aires","BANDFIELD","1828","Patinadora","Lomas De Zamora","50000","0","Facundo","25658558","Daniela","26721308","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1125","49553670","2009-07-29","Priscila Edith","Delgado","F","NACIONAL","","1166423247","Sucre 1073","Argentina","Buenos Aires","VILLA DE MAYO","1614","Patinadora","Malvinas Argentinas","50000","0","Delgado Raul Roberto","28039891","Segovia Natalia Soledad","31659121","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-13","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-13");
INSERT INTO patinadores VALUES("1196","49555402","2009-06-30","Delfina","Paredes","F","NACIONAL","benitezrosa725@gmail.com","1131490239","La Fronda 1625","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1416","Patinadora","Ciudad De Buenos Aires","50000","0","José Raúl Paredes","23987828","Rosa Benitez","93970068","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1129","49602470","2009-10-13","Nahiara","Fernández","F","NACIONAL","","1158498300","Leguizamon 414","Argentina","Buenos Aires","BURZACO","1850","Patinadora","Burzaco","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1168","49627788","2009-07-18","Ivan","Arriscal","M","NACIONAL","","1144013947","Salta 1768","Argentino","Buenos Aires","LANUS","1824","Patinador","Lanus","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1148","49676990","2009-08-12","Alma Emily","Gerez","F","PROMOCIONAL","","1133620094","Sarandi 5043","Argentina","Bs As","VILLA BALLESTER","1653","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1243","49702021","2009-08-06","Isabella","Gaudio","F","NACIONAL","leticiabosco@hotmail.com","1151426698","French 1533","Argentina","Buenos Aires","SAN MARTIN","1650","Patinadora","Gral. San Martin","50000","0","Gabriel Alfredo Gaudio","20396661","Leticia Bosco Laprovitera","92202529","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1044","49731105","2009-09-09","Isabella","Aguirre Rojo","F","NACIONAL","","1165377451","Garibaldi 572","Argentina","Argentina","TEMPERLEY","1834","Patinadora","Buenos Aires","50000","0","","0","","0","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04");
INSERT INTO patinadores VALUES("1124","49740472","2009-12-13","Fiorella Valentina","Insua","F","NACIONAL","danielaorsiniddt@gmail.com","1161872261","El Trebol 3972","Argentina","Buenos Aires","TEMPERLEY","1834","Patinadora","Lomas De Zamora","50000","0","Daniel Ramon Insua","28170357","Daniela Fernanda Orsini ","25154127","10014","Pendiente","Pendiente","39587141","Schmidt","Micaela Belen","10014","ITUZAINGO DE TEMPERLEY (ITZ)","2024-02-13","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1109","49740877","2010-03-11","Nahiara Evelyn","Otazú","F","PROMOCIONAL","","1166633132","Raúl Soldi 718","Argentina","Buenos Aires","GLEW","1856","Patinadora","Almirante Brown","45000","0","Otazú Cristian Javier","93880094","Fischer Gisela Rosa","31251380","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09");
INSERT INTO patinadores VALUES("1210","49758668","2009-08-12","Isabella","Ricciolini","F","NACIONAL","patinpuntuar@gmail.com","1156397197","Vallejos 4737","Argentina","Caba","CABA","1417","Patinadora","Caba","50000","0","Victor Ricciolini ","20620300","Ana Riboloff ","25435782","10018","Pendiente","Pendiente","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16");
INSERT INTO patinadores VALUES("1183","49758789","2009-09-18","Agustina Nicole","Santos Garcia","F","NACIONAL","agustinasantosgarcia18@gmail.com","1131190099","Venezuela 2829","Argentina","Buenos Aires","CABA","1211","Patinadora","Caba","50000","0","Alfredo Santos","26389926","Melina Garcia Nogales","28173987","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1218","49759560","2009-07-22","Alma","Umpierrez","F","NACIONAL","julietapedraza@yahoo.com.ar","1149759560","Eva Perón 4865","Argentina","Buenos Aires","VILLA BONICH","1650","Patinadora","San Martin","50000","0","Pablo Umpierrez","92797330","Julieta Pedraza","30315566","10024","Pendiente","Pendiente","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1185","49760029","2009-08-19","Nahiara Ludmila","Rivadeneira","F","NACIONAL","","493118083","Gritp De Asencio 3341","Argentina","Caba","CABA","1437","Patinadora","Caba","50000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1177","49761918","2009-08-08","Ariana Nicole","Cabaña","F","NACIONAL","cabana5toc@gmail.com","1144086052","Warnes 3690","Argentina","Buenos Aires","LANUS OESTE","1824","Patinadora","Lomas De Zamora","50000","0","Walter Andres Cabaña","20640091","Stella Maris Ortiz","20893862","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1121","49833810","2009-10-16","Micaela Valentina","Sanfilippo","F","NACIONAL","","2215231407","Calle 450 E/ 157y 160 ","Argentina","Buenos Aires","CITY BELL","1896","Patinadora","La Plata","50000","0","Sergio Sanfilippo","25224134","Erica Marti","26946439","10011","Pendiente","Pendiente","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-10","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1216","49903793","2009-11-20","Mora Vanina","Lizarraga","F","NACIONAL","vaninaalfieri@hotmail.com","1158737190","Presidente Derqui 2530","Argentina","Buenos Aires","EL PALOMAR","1684","Patinadora","Moron","50000","0","Horacio Daniel Lizarraga","23018135","Vanina Alfieri","26034668","10024","Pendiente","Pendiente","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1244","49918687","2010-08-12","Ariadna Aylen","González","F","NACIONAL","paulamarielguzman@gmail.com","1153436233","Lavalle 4440","Argentina","Buenos Aires","BILLINGHURST","1650","Patinadora","Gral. San Martin","50000","0","Walter Damián González","31555936","Paula Mariel Guzmán","32335657","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1211","50026371","2010-01-02","Jazmin","De Cillis","F","NACIONAL","patinpuntuar@gmail.com","1135735893","Cuenca 1478","Argentina","Buenos Aires","SAN MARTIN","1650","Patinadora","San Martin","50000","0","Guillermo De Cillis","22931822","Vanesa Cappella","21982966","10018","Pendiente","Pendiente","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1102","50027681","2010-01-08","Agustina","Cubiatebehere","F","NACIONAL","","2215412114","485 Nro 1225","Argentina","Buenos Aires","MANUEL B. GONNET","1897","Patinadora","La Plata","50000","0","Cubiatebehere Javier","26468410","Marino Silvia","25269804","10011","Pendiente","Pendiente","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1266","50076089","2010-09-29","Jazmin Celene","Palacio","F","NACIONAL","noeliaromero1730@gmail.com","1123856864","Gral Belgrano 488","Argentina","Buenos Aires","CLAYPOLE","1849","Patinadora","Almirante Brown","50000","0","","0","Noelia","33335044","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1190","50145601","2010-02-23","Martina","Rodriguez","F","NACIONAL","","1157713391","Velloso 3553","Argentina","Buenos Aires","REMEDIOS DE ESCALADA","1826","Patinadora","Lanús","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1108","50157087","2010-01-29","Milagros","Maldonado Deviagge","F","NACIONAL","","1158649055","Batalla De Pavón 656","Argentina","Buenos Aires","GLEW","1856","Patinadora","Almirante Brown","50000","0","Maldonado Fernandez Ricardo David","92815977","Deviagge Laura Cristina","21090087","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1245","50159283","2010-05-25","Agustina","Sormilich","F","NACIONAL","amarantaalvedro@gmail.com","1558302906","Griveo 3937 Depto. 4","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1419","Patinadora","Ciudad De Buenos Aires","50000","0","Sebastian Sormilich ","23781525","Amaranta Alvedro","24459618","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1111","50276731","2010-05-01","Ana Luz","Caballero Benitez","F","NACIONAL","","1172346345","San Ignacio 3182","Argentina","Buenos Aires","GLEW","1856","Patinadora","Almirante Brown","50000","0","","0","Benitez Gimenez Alba Victoria ","94907042","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09");
INSERT INTO patinadores VALUES("1031","50291276","2010-07-21","Felicitas","Pirovano","F","NACIONAL","mirnapirovano@hotmail.com","1149328220","Cochabamba 3475","Argentina","Capital Federal","CABA","1252","Patinadora","Caba","50000","0","Pablo Pirovano","22878839","Mirna Rodriguez","24378577","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-01","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-02");
INSERT INTO patinadores VALUES("1149","50291845","2010-05-07","Maria De Los Angeles","Schiffer","F","PROMOCIONAL","","1162673175","Avenida Central 7995","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1265","50304793","2010-05-16","Martina Selene","Perez","F","NACIONAL","elysosa1985@gmail.com","1123856864","Av. Rosales 1440","Argentina","Buenos Aires","R. DE ESCALADA","1826","Patinadora","Lanus","50000","0","Raul","29066270","Elisabeth","32023079","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1187","50305726","2010-05-14","Magaly Jazmin","Pitrella","F","NACIONAL","","1136119285","Ferre 2860","Argentina","Buenos Aires","REMEDIOS DE ESCALADA","1826","Patinadora","Lanús","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1173","50321796","2010-06-09","Alma Micaela","Perez","F","NACIONAL","karinaalejandraceballos@gmail.com","1157075153","Av. Medrano 579 2 A","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1179","Patinadora","Ciudad De Buenos Aires","50000","0","Sergio Gabriel Perez","30416468","Karina Alejandra Ceballos","23192306","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1178","50418344","2010-07-07","Abigail Rubi","Cipra Melgar","F","NACIONAL","gretshen.melgar@gmail.com","1169043099","Av. Jujuy 1344","Argentina","Buenos Aires","CABA","1221","Patinadora","Caba","50000","0","Erik Jeferson Cipra Romero","93972185","Gretshen Fiorella Melgar Barreto","94635508","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1226","50439782","2010-08-05","Violeta","Sandoval Cicconi","F","NACIONAL","","","Serrano 287 Piso 18/1","Argentina","Caba","CABA","1414","Patinadora","Caba","50000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1150","50532715","2010-08-07","Diana","Luy Martinez","F","PROMOCIONAL","","1153372627","Calle 134 Y 33 Orientales 5361","Argentina","Bs As","VILLA BALLESTER","1653","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1151","50532779","2010-08-12","Valentina","Villalva","M","PROMOCIONAL","","","Los Alelies 7255","Argentina","Bs As","SAN MARTIN","1657","Patinador","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1152","50547328","2010-11-22","Ambar ","Palmisano","F","PROMOCIONAL","","1126835238","Agustin Alvarez 2326","Argentina","Bs As","VILLA BALLESTER","1653","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1153","50637180","2010-11-02","Iara Abigail","Blanco","F","PROMOCIONAL","","1162851586","Ibarborou 4732","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1246","50651346","2010-10-20","Mia ","Costabile","F","NACIONAL","miacostabile@gmail.com","1155764204","Del Kaiser 1355","Argentina","Buenos Aires","VILLA BOCH","1682","Patinadora","3 De Febrero","50000","0","Gonzalo Daniel Costabile","29862415","Natalia Carolina Krujoski","35018846","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1097","50701570","2010-10-27","Anahi Ailén","Corsaro","F","NACIONAL","","1131141614","Pavon 2757","Argentina","Buenos Aires","CABA","1248","Patinadora","Caba","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1120","50839224","2011-03-05","Tiziano","Monjes","M","NACIONAL","","2214815049","486 Nro 4628","Argentino","Buenos Aires","JOAQUIN GORINA","1896","Patinador","La Plata","50000","0","","0","Evelyn Denise Gorriz","38298109","10011","Pendiente","Pendiente","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-10","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1041","50885612","2011-11-16","María Luz","Herrera","F","NACIONAL","","1126194292","Argentina 2650","Argentina","Buenos Aires","VALENTIN ALSINA","1822","Patinadora","Lanús","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1247","50987383","2011-02-24"," Thais Malena ","Chanel Benitez","F","NACIONAL","Marielavb78@gmail.com","1139419680","18 De Diciembre 1603 ","Argentina","Buenos Aires","SAN MARTIN","1650","Patinadora","Gral. San Martin","50000","0","","0","Mariela Vanesa Benitez ","26666261","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1212","51060545","2009-07-24","Mia","Esquivel","F","NACIONAL","patinpuntuar@gmail.com","1569779680","Avenida Libertador 7753","Argentina","Buenos Aires","J. L. SUAREZ","1655","Patinadora","San Martín","50000","0","Carlos Alberto Esquivel ","30641868","Benincasa Nancy Elizabeth","36665387","10018","Pendiente","Pendiente","39171656","Florencia","Pollero","10018","PATIN PUNTUAR (PNTR)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1172","51067678","2011-04-08","Victoria Cecilia","Maquioli Padilla","F","NACIONAL","guillerminapadilla@gmail.com","1131143033","Av. Santa Fe 5073","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1425","Patinadora","Ciudad De Buenos Aires","50000","0","Damián Eduardo Maquioli Rodriguez","33747884","María Guillermina Padilla","33488559","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1225","51120149","2011-05-04","Victoria ","Perez Nieto","F","NACIONAL","","","Virrey Liniers 1763","Argentina","Caba","CABA","1252","Patinadora","Caba","50000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1098","51168695","2011-11-04","Rosario","Sequeira","F","NACIONAL","","1164791421","Calle 75 Y 129","Argentina","Buenos Aires","HUDSON","1820","Patinadora","Berazategui","50000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1197","51245914","2011-07-04","Isabela","Fernández Ortíz","F","RUD","","1127119029","José Enrique Rodo 1445","Argentina","Buenos Aires","WILDE","1875","Patinadora","Avellaneda","15000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1106","51327063","2011-12-05","Catalina Brunella","Biondi","F","PROMOCIONAL","","1137744759","Campbell 377","Argentina","Buenos Aires","GLEW","1856","Patinadora","Almirante Brown","45000","0","Biondi Emiliano Nicolas","35828289","Ramirez Gabriela Analia","36483394","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09");
INSERT INTO patinadores VALUES("1264","51511594","2011-10-14","Felicitas ","Acevedo","F","NACIONAL","angelamellone270@gmail.com","1130875092","Palpa 3535","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1424","Patinadora","Ciudad De Buenos Aires","50000","0","Alejandro Acevedo","32275747","Carina Mellone","31472511","10002","Pendiente","Registrado","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-27");
INSERT INTO patinadores VALUES("1221","51583274","2011-07-29","Delfina","Castro","F","NACIONAL","","","Santiago De Liniers 3281","Argentina","Caba","CABA","1702","Patinadora","Caba","50000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1118","52018673","2012-02-09","Emma","Urrunaga","F","NACIONAL","valemmacolor@gmail.com","1121712539","Blanco Encalada 2169","Argentina","Buenos Aires","LANUS ESTE","1824","Patinadora","Lanus","50000","0","Federico","31446540","Yanina","28517183","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1182","52137475","2012-02-13","Lucia Nahiara","Peralta","F","NACIONAL","rumildab4@gmail.com","1130528519","Villa 1 11 14 Manzana 31 Casa 17","Argentina","Buenos Aires","CABA","1406","Patinadora","Caba","50000","0","Cervelio Peralta","94522438","Rumilda Benitez","95007015","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1154","52139350","2012-01-12","Miranda","Torrez","F","PROMOCIONAL","","1137619907","Calle A Nro 3764","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1048","52198425","2012-04-28","Guadalupe Milagros","Garcia","F","NACIONAL","","1162881318","San Francisco De Asis 380","Argentina","Buenos Aires","CLAYPOLE","1849","Patinadora","Almirante Brown","50000","0","","0","","0","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-04","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1201","52454814","2012-05-10","Emma","Buffa","F","NACIONAL","emmabuffapatin@gmail.com","1159456518","Franklin Roosevelt 5657","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1431","Patinadora","Ciudad De Buenos Aires","50000","0","Bruno Buffa","26317507","Janet Ianina Quintana","27346505","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1248","52640968","2012-06-19","Mila ","Barletta Miguez","F","NACIONAL","nudaverita@yahoo.com.ar","1558253451","Arribeños 2153 9 E","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1429","Patinadora","Ciudad De Buenos Aires","50000","0","Juan Barletta ","24069175","Vanina Gisela Miguez ","24482991","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1220","52760835","2012-10-03","Maria Eva","Barbosa Cioffi","F","NACIONAL","","","Azucena Villaflor 450 P 18/3","Argentina","Caba","CABA","1107","Patinadora","Caba","50000","0","","0","","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1269","52785883","2012-12-04","Aylen Jazminn","Reparaz","F","PROMOCIONAL","marinasoledadaguirre1987@gmail.com","1168684814","Sebastian Gaboto 3713","Argentina","Buenos Aires","R. DE ESCALADA","1826","Patinadora","Lanus","45000","0","Fernando","32756569","Marina","33335238","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1249","52858600","2012-11-20","Felipe ","Rocha Fontana","M","NACIONAL","natalia.fontana@bue.edu.ar","1150524461","Av. Alvarez Thomas 2389 1e","Argentina","Buenos Aires","CUIDAD DE BUENOS AIRES","1431","Patinador","Ciudad De Buenos Aires","50000","0","Juan Francisco Rocha","30923890","Natalia Fontana","26577047","10002","Pendiente","Pendiente","23192306","Karina Alejandra","Ceballos","10002","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","2024-02-16","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1204","53063861","2013-04-07","Sofia","Gonzalez Robaina","F","PROMOCIONAL","","1144464776","Kellertas 331","Argentina","Buenos Aires","LOMCHAMPS","1864","Patinadora","Presidente Perón","45000","0","","0","Jesica Belén Robaina","32956657","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-15","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-15");
INSERT INTO patinadores VALUES("1155","53147403","2013-05-10","Selene Nair","Aguirre","F","PROMOCIONAL","","","Berlin 1335","Argentina","Bs As","LOMA HERMOSA","1657","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1112","53207033","2013-06-12","Sofia Eleonor","Villagra","F","NACIONAL","","","12 De Octubre 536","Argentina","Buenos Aires","ALEJANDRO KORN","1864","Patinadora","San Vicente","50000","0","Villagra Marcelo Fabian","31866633","Altamiranda Angélica Elvira","31292071","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1042","53292664","2013-07-22","Emilia","Mik","F","NACIONAL","","2214362580","15   3116","Argentina","Buenos Aires","PUNTA LARA","1931","Patinadora","Ensenada","50000","0","Leonardo Mik","0","Mariana Cabrera","0","10001","Pendiente","Pendiente","29753800","Barbara","Sudini","10001","APANOVI (APNV)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1107","53295119","2013-06-25","Maia Valentina","Gorosito Salazar","F","NACIONAL","","1153311809","Vte. López Y Planes 172","Argentina","Buenos Aires","GLEW","1856","Patinadora","Almirante Brown","50000","0","Gorosito Maximiliano Leandro","33513953","Salazar Daniela Alejandra","33985387","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09");
INSERT INTO patinadores VALUES("1110","53299744","2013-09-01","Valentina","Dente","F","PROMOCIONAL","","1123823251","118 N°403","Argentina","Buenos Aires","GUERNICA","1862","Patinadora","Presidente Perón","45000","0","Dente Antonio Jesús","30882692","Verón Daiana Soledad","38634970","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-09");
INSERT INTO patinadores VALUES("1034","53456494","2013-10-01","Guillermina Zoe","Tanielian","F","RUD","walteriglesias11@gmail.com","1567690509","Elías Vedoya 3420","Argentina","Buenos Aires","REMEDIOS DE ESCALADA","1826","Patinadora","Lanús","15000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-02","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1103","53748756","2014-02-15","Catalina","Cubiatebehere","F","NACIONAL","","2215412114","485 Nro 1225","Argentina","Buenos Aires","MANUEL B. GONNET","1897","Patinadora","La Plata","50000","0","Cubiatebehere Javier","26468410","Marino Silvia","25269804","10011","Pendiente","Pendiente","36778262","Ana Carolina","Papoff","10011","EPAC.CB  (EPAC)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1156","53825929","2014-02-26","Dana Fabiola","Benitez","F","PROMOCIONAL","","1125642721","Almirante Brown 1429","Argentina","Bs As","VILLA BALLESTER","1653","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1157","53876612","2014-03-07","Martina","Jara","F","PROMOCIONAL","","1127923172","Formosa 5860","Argentina","Bs As","VILLA BALLESTER","1653","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1166","53948364","2014-04-07","Olivia","Pellegrino","F","RUD","","1152476235","Rocha 1612 6to Piso","Argentina","Caba","CABA","1870","Patinadora","Caba","15000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-14","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1158","54100656","2014-07-01","Lisa Morena","Nuñez","F","PROMOCIONAL","","1138407391","Solis 7249","Argentina","Bs As","LOMA HERMOSA","1657","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1159","54455412","2014-12-11","Jana Nicole","Fritzler","F","PROMOCIONAL","","1162914548","Calle A Nro 4015","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1099","54510387","2015-03-27","Eluney Aline","Garrido","F","RUD","","1161445346","Olegario Victor Andrade 476","Argentina","Buenos Aires","LANUS","1824","Patinadora","Lanús","15000","0","","0","","0","10009","Pendiente","Pendiente","25133499","Walter","Iglesias","10009","CLUB ATLETICO LANUS (CAL)","2024-02-09","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1160","54523900","2015-01-31","Brisa Aylen","Duarte Noguera","F","PROMOCIONAL","","1127012327","Calle B 8337 Entre 4 Y 5","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1161","54724517","2015-04-02","Micol Abigail","Muga","F","PROMOCIONAL","","1140221490","Estrada 4398","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1203","55145223","2015-08-13","Ambar","Antoniani  Canario","F","PROMOCIONAL","","1132903627","Echeverría 12","Argentina","Buenos Aires","SAN VICENTE","1864","Patinadora","San Vicente","45000","0","Antoniani Guillermo","0","Canario Viviana","32196454","10022","Pendiente","Pendiente","26328130","Romina Bernardette","Carmona","10022","SOUTH SKATE (SSK)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1184","95985653","2012-12-29","Marcela Valentina","Silva Rodriguez","F","NACIONAL","Marielyscarolina16@gmail.com","1161512678","Curapaligue 67 Piso 3","Venezolana","Buenos Aires","CABA","1406","Patinadora","Caba","50000","0","Kelber Alexey Silva Ramirez","95962196","Marielys Carolina Rodriguez","95961707","10016","Pendiente","Pendiente","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1162","96042675","2017-03-21","Luciana","Cermeño Indaburo","F","PROMOCIONAL","","1123001018","12 De Octubre 6593","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO patinadores VALUES("1163","96045182","2014-07-29","Fiorella Sophia","Cermeño Indaburo","F","PROMOCIONAL","","1123001018","12 De Octubre 6593","Argentina","Bs As","JOSE LEON SUAREZ","1655","Patinadora","San Martin","45000","0","","0","","0","10007","Pendiente","Pendiente","35364631","Marianela","Vitale","10007","CEMEF (CMEF)","2024-02-07","0","","","0","","0000-00-00");



DROP TABLE IF EXISTS podios;

CREATE TABLE `podios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dnibuenafe` bigint(20) NOT NULL,
  `edad` int(3) NOT NULL,
  `institucion` varchar(100) COLLATE utf8_bin NOT NULL,
  `divisional` varchar(20) COLLATE utf8_bin NOT NULL,
  `eficiencia` varchar(100) COLLATE utf8_bin NOT NULL,
  `categoria` varchar(100) COLLATE utf8_bin NOT NULL,
  `disciplina` varchar(100) COLLATE utf8_bin NOT NULL,
  `podioanual` varchar(100) COLLATE utf8_bin NOT NULL,
  `podiotorneo` int(11) NOT NULL,
  `puntospatinador` int(11) DEFAULT NULL,
  `puntosclub` int(11) DEFAULT NULL,
  `asistencia` int(11) DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dnibuenafe` (`dnibuenafe`)
) ENGINE=InnoDB AUTO_INCREMENT=4000 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




DROP TABLE IF EXISTS prebuenafe;

CREATE TABLE `prebuenafe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dnibuenafe` bigint(20) NOT NULL,
  `divisional` varchar(20) COLLATE utf8_bin NOT NULL,
  `eficiencia` varchar(100) COLLATE utf8_bin NOT NULL,
  `categoria` varchar(100) COLLATE utf8_bin NOT NULL,
  `disciplina` varchar(100) COLLATE utf8_bin NOT NULL,
  `apagar` bigint(20) DEFAULT NULL,
  `pagado` bigint(100) DEFAULT NULL,
  `torneo` varchar(100) COLLATE utf8_bin NOT NULL,
  `posicion` int(11) DEFAULT NULL,
  `ordensalida` int(11) DEFAULT NULL,
  `fechatorneo` date DEFAULT NULL,
  `horatorneo` time DEFAULT NULL,
  `podiotorneo` int(11) DEFAULT NULL,
  `puntospatinador` int(11) DEFAULT NULL,
  `puntosclub` int(11) DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `observaciones` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dnibuenafe` (`dnibuenafe`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




DROP TABLE IF EXISTS prepatinadores;

CREATE TABLE `prepatinadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dnipatinador` bigint(20) NOT NULL,
  `fechanacpatinador` date NOT NULL,
  `nombrepatinador` varchar(100) COLLATE utf8_bin NOT NULL,
  `apellidopatinador` varchar(100) COLLATE utf8_bin NOT NULL,
  `sexopatinador` varchar(20) COLLATE utf8_bin NOT NULL,
  `tipolicencia` varchar(50) COLLATE utf8_bin NOT NULL,
  `emailpatinador` varchar(255) COLLATE utf8_bin NOT NULL,
  `telefonopatinador` varchar(50) COLLATE utf8_bin NOT NULL,
  `domiciliopatinador` varchar(255) COLLATE utf8_bin NOT NULL,
  `nacionalidadpatinador` varchar(100) COLLATE utf8_bin NOT NULL,
  `provinciapatinador` varchar(100) COLLATE utf8_bin NOT NULL,
  `localidadpatinador` varchar(50) COLLATE utf8_bin NOT NULL,
  `cppatinador` varchar(50) COLLATE utf8_bin NOT NULL,
  `funcionpatinador` varchar(100) COLLATE utf8_bin NOT NULL,
  `partidopatinador` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `valorLicencia` bigint(100) DEFAULT NULL,
  `pagoLicencia` bigint(100) DEFAULT NULL,
  `nombrepadre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dnipadre` int(20) DEFAULT NULL,
  `nombremadre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dnimadre` int(20) DEFAULT NULL,
  `cuit` bigint(20) DEFAULT NULL,
  `estadocap` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `estadoseguro` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`dnipatinador`),
  KEY `id` (`id`),
  KEY `cuit` (`cuit`)
) ENGINE=InnoDB AUTO_INCREMENT=1217 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO prepatinadores VALUES("1213","44259991","2002-09-12","Candela Ailen","Rios","F","NACIONAL","","2215012777","Peru 726","Argentina","Buenos Aires","ENSENADA","1925","Patinadora","Ensenada","50000","0","","0","","0","10006","Pendiente","Pendiente","23208053","Greta Cloe","Cantarelli","10006","DEFENSORES DE CAMBACERES (CBCR)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO prepatinadores VALUES("1026","44362103","2002-07-18","Josefina","Perez","F","","JOSEFINA.PEREZ@GMAIL.COM","11323526","Benito Juarez 2332","Argentina","Buenos Aires","VALENTIN ALSINA","1870","Patinadora","Lanus","0","0","","0","","0","11111111111","Pendiente","Pendiente","35435520","Barbara","Sudini","11111111111","LEPAA","2023-12-16","0","","","0","","0000-00-00");
INSERT INTO prepatinadores VALUES("1214","49892928","2010-01-11","Nahiara ","Barba","F","PROMOCIONAL","","2215958150","Quintana Casa 24","Argentina","Buenos Aires","ENSENADA","1925","Patinadora","Ensenada","45000","0","","0","Fatima Medina","22679130","10006","Pendiente","Pendiente","23208053","Greta Cloe","Cantarelli","10006","DEFENSORES DE CAMBACERES (CBCR)","2024-02-17","0","","","0","","0000-00-00");
INSERT INTO prepatinadores VALUES("1082","52196754","2012-02-15","Valentina Magali ","Godoy","F","RUD","alevalen910@gmail.com","1122588076","Suipacha 851","Argentina","Buenos Aires","VILLA BOSCH","1682","Patinadora","Tres De Febrero","15000","0","Derlis Joel Godoy Villalba","94282729","Maria Alejandra Gonzalez","28107785","10024","Pendiente","Pendiente","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-08","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-18");
INSERT INTO prepatinadores VALUES("1078","52655544","2012-08-03","Lucila Micaela ","Yormetti","F","RUD","cj_salomon89@hotmail.com","1156009959","Simón Bolívar 5589","Argentina","Buenos Aires","CASEROS","1678","Patinadora","Tres De Febrero","15000","0",".","0","Julieta Salomon","34973594","10024","Pendiente","Pendiente","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-08","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-18");
INSERT INTO prepatinadores VALUES("1179","52656347","2012-07-23","Delfina","Ardila Quintana","F","RUD","loreq2001@hotmail.com","1133115993","La Calandria 870","Argentina","Buenos Aires","VILLA ADELINA","1607","Patinadora","San Isidro","15000","0","Carlos Rubén Ardila","23075405","Maria Lo","24756464","10024","Pendiente","Pendiente","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-16","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-18");
INSERT INTO prepatinadores VALUES("1052","53063125","2013-03-15","Francesca Mia","Labonia","F","RUD","","","Bariloche 764","Argentina","Buenos Aires","VILLA SARMIENTO","B1707","Patinadora","Moron","15000","0","Maximiliano Labonia","30513014","Sabrina Annetta","27315672","10024","Pendiente","Pendiente","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-07","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-18");
INSERT INTO prepatinadores VALUES("1072","53214915","2013-04-08","Emily Monserrat","Sandoval Cantero","F","NACIONAL","lesmeemil@gmail.com","1168917266","Gabriel Linares 4955","Argentina","Buenos Aires","CASEROS","1678","Patinadora","Tres De Febrero","50000","0","Cesar Sandoval","94340832","Lizza Cantero","94619570","10024","Pendiente","Pendiente","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO prepatinadores VALUES("1053","54387508","2014-11-19","Emilia Lucia","Spinogatti","F","NACIONAL","lpiovicaep@gmail.com","1140763961","Gaucho Cruz 5066","Argentina","Buenos Aires","VILLA BOSCH","1682","Patinadora","Tres De Febrero","50000","0","Diego Martin Spinogatti","26118895","Luciana Natalia Piovi","24620173","10024","Pendiente","Pendiente","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-07","31776870","Leila Jael","Vanzulli","10024","CLUB ATLETICO EL PALOMAR (CAPL)","2024-02-08");
INSERT INTO prepatinadores VALUES("1212","55042869","2015-09-21","Charo","Marzaroli","F","PROMOCIONAL","","2215556220","L.n. Alem Nº 27  ","Argentina","Buenos Aires","ENSENADA","1925","Patinadora","Ensenada","45000","0","","0","Guerrero Maria Jimena","28046768","10006","Pendiente","Pendiente","23208053","Greta Cloe","Cantarelli","10006","DEFENSORES DE CAMBACERES (CBCR)","2024-02-17","23208053","Greta Cloe","Cantarelli","10006","DEFENSORES DE CAMBACERES (CBCR)","2024-02-17");



DROP TABLE IF EXISTS prerecibos;

CREATE TABLE `prerecibos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuit` bigint(100) NOT NULL,
  `tipo_comprobante` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `num_comprobante` bigint(100) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `concepto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `num_comp_pago` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `forma_pago` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `entidad_pago` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `adeudado` bigint(100) DEFAULT NULL,
  `pagado` bigint(100) DEFAULT NULL,
  `saldo` bigint(100) DEFAULT NULL,
  `img_comp_pago` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dnipatinador` bigint(20) DEFAULT NULL,
  `tipolicencia` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `id_depositante` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `num_recibo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `comentarios` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `foto` text COLLATE utf8_bin DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




DROP TABLE IF EXISTS recicled;

CREATE TABLE `recicled` (
  `reccled_id` int(11) NOT NULL AUTO_INCREMENT,
  `recicleddni` bigint(20) DEFAULT NULL,
  `reciclednombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `recicledapellido` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `recicledinstitucion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `recicledtabla` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `otro` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dnibaja` bigint(20) DEFAULT NULL,
  `nombrebaja` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidobaja` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `institucionbaja` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fechabaja` date DEFAULT NULL,
  PRIMARY KEY (`reccled_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3256 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO recicled VALUES("3227","44362103","Pablo","Donato","LEPAA (LEPAA)","Usuarios","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14");
INSERT INTO recicled VALUES("3228","22645400","Mariano F","Donato","LEPAA (LEPAA)","Usuarios","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14");
INSERT INTO recicled VALUES("3229","28","RUD PROMOCIONAL","","","TipoLicencias","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-02-01");
INSERT INTO recicled VALUES("3230","5088561","María Luz","Herrera","CLUB ATLETICO LANUS (CAL)","Pre-Padron","","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-02");
INSERT INTO recicled VALUES("3231","45756437","Renata","Tescari","LEPAA (LEPAA)","Pre-Padron","","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-05");
INSERT INTO recicled VALUES("3232","10012","-","","ESTUDIANTES DEL NORTE (EDN)","Club","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-07");
INSERT INTO recicled VALUES("3233","41","Selectivo.  Divisional B. Copa Apertura","","","Categorias","","251334991","Walter","Iglesias","FEDERACION RIOPLATENSE (FPR)","2024-02-09");
INSERT INTO recicled VALUES("3234","49550939","Florencia","Come","LEPAA (LEPAA)","Pre-Padron","","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10");
INSERT INTO recicled VALUES("3235","50076089","Jazmin Celene","Palacio","LEPAA (LEPAA)","Pre-Padron","","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10");
INSERT INTO recicled VALUES("3236","50304793","Martina Selene","Perez","LEPAA (LEPAA)","Pre-Padron","","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10");
INSERT INTO recicled VALUES("3237","52785883","Jazmin Aylen","Reparaz","LEPAA (LEPAA)","Pre-Padron","","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10");
INSERT INTO recicled VALUES("3238","50018673","Emma","Urrunaga","LEPAA (LEPAA)","Pre-Padron","","23660292","Sandra","Barzola","LEPAA (LEPAA)","2024-02-10");
INSERT INTO recicled VALUES("3239","49627788","Ivan","Arriscal","CLUB ATLETICO LANUS (CAL)","Inscripcion Provisoria","","25133499","Walter","Iglesias","CLUB ATLETICO LANUS (CAL)","2024-02-15");
INSERT INTO recicled VALUES("3240","47790595","Victoria","Carabajal","SOUTH SKATE (SSK)","Inscripcion Provisoria","","26328130","Romina Bernardette","Carmona","SOUTH SKATE (SSK)","2024-02-17");
INSERT INTO recicled VALUES("3241","48508548","Morena","Barrios Canay","LEPAA (LEPAA)","Buena Fe","","16762606","Liliana","Camacho","FEDERACION RIOPLATENSE (FPR)","2024-02-20");
INSERT INTO recicled VALUES("3242","48159819","Victoria","Massimino","CLUB ATLETICO LANUS (CAL)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3243","48508548","Morena","Barrios Canay","LEPAA (LEPAA)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3244","52454814","Emma","Buffa","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3245","44969164","María Josefina","Delgado","CLUB ATLETICO LANUS (CAL)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3246","49238102","Valentina","Gallego","CLUB ATLETICO LANUS (CAL)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3247","52198425","Guadalupe Milagros","Garcia","LEPAA (LEPAA)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3248","45679359","Agustina","Garcia Bernardini","CLUB ATLETICO LANUS (CAL)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3249","42874079","Gianella","Gianuzzi","APANOVI (APNV)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3250","48159819","Victoria","Massimino","CLUB ATLETICO LANUS (CAL)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3251","50321796","Alma Micaela","Perez","AAAJ - ASOC. ATLETICA ARGENTINOS JUNIOS (AAAJ)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3252","40227211","Luciano","Prieto","CLUB ATLETICO LANUS (CAL)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3253","46499243","Carolina","Rodriguez","CLUB ATLETICO LANUS (CAL)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3254","46272949","Lucia","Susundey","CLUB ATLETICO LANUS (CAL)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO recicled VALUES("3255","52018673","Emma","Urrunaga","LEPAA (LEPAA)","Buena Fe","","236602921","Sandra","Barzola","FEDERACION RIOPLATENSE (FPR)","2024-02-22");



DROP TABLE IF EXISTS relacion_tablas_ddec;

CREATE TABLE `relacion_tablas_ddec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_divisional` int(11) DEFAULT NULL,
  `id_disciplina` int(11) DEFAULT NULL,
  `id_eficiencia` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `edad_desde` int(11) DEFAULT NULL,
  `edad_hasta` int(11) DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Divisional` (`id_divisional`),
  KEY `Categoria` (`id_categoria`),
  KEY `Disciplina` (`id_disciplina`),
  KEY `Eficiencia` (`id_eficiencia`),
  CONSTRAINT `Categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Divisional` FOREIGN KEY (`id_divisional`) REFERENCES `divisional` (`id`) ON DELETE CASCADE,
  CONSTRAINT `Eficiencia` FOREIGN KEY (`id_eficiencia`) REFERENCES `eficiencia` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1108 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO relacion_tablas_ddec VALUES("14","9","38","7","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("15","9","38","7","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("16","9","38","7","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("17","9","38","7","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("18","9","38","7","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30");
INSERT INTO relacion_tablas_ddec VALUES("19","9","38","7","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("20","9","38","7","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("21","9","37","7","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("22","9","37","7","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("23","9","37","7","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("24","9","37","7","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("25","9","37","7","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("26","9","37","7","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("27","9","37","7","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-30","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("28","9","35","7","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("29","9","35","7","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("30","9","35","7","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("31","9","35","7","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("32","9","35","7","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("33","9","35","7","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("34","9","35","7","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("42","9","50","7","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("43","9","50","7","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("44","9","50","7","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("45","9","50","7","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("46","9","50","7","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("47","9","50","7","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("48","9","50","7","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("49","9","51","7","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("50","9","51","7","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("51","9","51","7","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("52","9","51","7","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("53","9","51","7","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("54","9","51","7","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("55","9","51","7","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("56","9","45","7","36","12","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("57","9","47","7","36","12","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("58","9","46","7","35","12","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("59","9","53","7","35","12","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("60","9","53","7","36","12","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("61","9","44","7","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("62","9","44","7","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("63","9","42","7","37","12","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("64","9","42","7","35","12","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("65","9","42","7","36","12","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("66","6","37","6","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("67","6","37","6","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("68","6","37","6","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("69","6","37","6","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("70","6","37","6","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("71","6","37","6","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("72","6","37","6","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("73","6","37","4","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31");
INSERT INTO relacion_tablas_ddec VALUES("74","6","37","4","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("75","6","37","4","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("76","6","37","4","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("77","6","37","21","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("78","6","44","27","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("79","6","44","27","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("80","6","38","16","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("81","6","38","16","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("82","6","38","16","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("83","6","38","16","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("84","6","38","16","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("85","6","38","16","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("86","6","51","27","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("87","6","51","27","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("88","6","51","27","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("89","6","51","27","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("90","6","51","27","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("91","6","51","27","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("92","6","51","27","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("93","6","35","6","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("94","6","35","6","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("95","6","35","6","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("96","6","35","6","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("97","6","35","6","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("98","6","35","6","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("99","6","35","6","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("100","6","35","4","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("101","6","35","4","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("102","6","35","4","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("103","6","35","4","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("104","6","35","4","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("105","6","35","4","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("106","6","35","4","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("107","7","37","5","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("108","7","37","5","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("109","7","37","5","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("110","7","37","5","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("111","7","37","5","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("112","7","37","5","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("113","7","37","5","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("114","7","37","8","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("115","7","37","8","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("116","7","37","8","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("117","7","37","8","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("118","7","37","8","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("119","7","37","8","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("120","7","37","8","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("121","7","37","9","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("122","7","37","9","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("123","7","37","9","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("124","7","37","9","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("125","7","37","9","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("126","7","37","9","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("127","7","37","9","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("128","7","37","15","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("129","7","37","15","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("130","7","37","15","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("131","7","37","15","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("132","7","37","15","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("133","7","37","15","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("134","7","37","15","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("135","7","44","16","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("136","7","44","16","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("137","7","51","27","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("138","7","51","27","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("139","7","51","27","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("140","7","51","27","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("141","7","51","27","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("142","7","51","27","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("143","7","51","27","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("144","7","38","17","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("145","7","38","17","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("146","7","38","17","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("147","7","38","17","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("148","7","38","17","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("149","7","38","17","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("150","7","38","17","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("151","7","44","40","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("152","7","44","40","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("155","7","35","5","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("156","7","35","5","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("157","7","35","5","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("158","7","35","5","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("159","7","35","5","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("161","7","35","8","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("162","7","35","8","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("163","7","35","8","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("164","7","35","8","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("165","7","35","8","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("166","7","35","8","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("167","7","35","9","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("168","7","35","9","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("169","7","35","9","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("170","7","35","9","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("171","7","35","9","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("172","7","35","9","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("173","7","35","9","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("174","7","35","15","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("175","7","35","15","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("176","7","35","15","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("177","7","35","15","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("178","7","35","15","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("179","7","35","15","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("180","7","35","15","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("181","8","37","5","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("182","8","37","5","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("183","8","37","5","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("184","8","37","5","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("185","8","37","5","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("186","8","37","5","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("187","8","37","5","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("188","8","37","5","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("189","8","37","5","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("190","8","37","8","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("191","8","37","8","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("192","8","37","8","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("193","8","37","8","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("194","8","37","8","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("195","8","37","8","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("196","8","37","8","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("197","8","37","8","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("198","8","37","8","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("199","8","37","9","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("200","8","37","9","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("201","8","37","9","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("202","8","37","9","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("203","8","37","9","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("204","8","37","9","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("205","8","37","9","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("206","8","37","9","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("207","8","37","9","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("208","8","37","10","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("209","8","37","10","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("210","8","37","10","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("211","8","37","10","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("212","8","37","10","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("213","8","37","10","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("214","8","37","10","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("215","8","37","10","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("216","8","37","10","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("217","8","37","11","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("218","8","37","11","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("219","8","37","11","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("220","8","37","11","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("221","8","37","11","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("222","8","37","11","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("223","8","37","11","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("224","8","37","11","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("225","8","37","11","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("226","8","37","29","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("227","8","37","29","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("228","8","37","29","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("229","8","37","29","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("230","8","37","29","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("231","8","37","29","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("232","8","37","29","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("233","8","37","29","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("234","8","37","29","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("235","8","35","5","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("236","8","35","5","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("237","8","35","5","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("238","8","35","5","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("239","8","35","5","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("240","8","35","5","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("241","8","35","5","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("242","8","35","5","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("243","8","35","5","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("244","8","35","8","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("245","8","35","8","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("246","8","35","8","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("247","8","35","8","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("248","8","35","8","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("249","8","35","8","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("250","8","35","8","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("251","8","35","8","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("252","8","35","8","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("253","8","35","9","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("254","8","35","9","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("255","8","35","9","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("256","8","35","9","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("257","8","35","9","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("258","8","35","9","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("259","8","35","9","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("260","8","35","9","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("261","8","35","9","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("262","8","35","10","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("263","8","35","10","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("264","8","35","10","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("265","8","35","10","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("266","8","35","10","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("267","8","35","10","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("268","8","35","10","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("269","8","35","10","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("270","8","35","10","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("271","8","35","11","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("272","8","35","11","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("273","8","35","11","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("274","8","35","11","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("275","8","35","11","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("276","8","35","11","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("277","8","35","11","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("278","8","35","11","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("279","8","35","11","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("280","8","35","29","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("281","8","35","29","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("282","8","35","29","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("283","8","35","29","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("284","8","35","29","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("285","8","35","29","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("286","8","35","29","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("287","8","35","29","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("288","8","35","29","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("289","8","44","27","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("290","8","44","27","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("291","8","38","18","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("292","8","38","18","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("293","8","38","18","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("294","8","38","18","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("295","8","38","18","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("296","8","38","18","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("297","8","38","18","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01");
INSERT INTO relacion_tablas_ddec VALUES("298","8","49","23","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("299","8","49","23","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("300","8","49","23","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("301","8","49","23","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("302","8","49","23","38","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("316","8","49","33","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("317","8","49","33","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("318","8","49","33","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("319","8","49","33","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("320","8","49","33","38","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("325","8","36","23","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("326","8","36","23","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("327","8","36","23","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("328","8","36","23","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("333","8","36","23","38","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("334","8","36","33","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("335","8","36","33","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("336","8","36","33","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("337","8","36","33","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("338","8","36","33","38","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("343","8","54","33","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("344","8","54","33","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("345","8","54","33","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("346","8","54","33","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("347","8","54","33","38","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("352","8","51","41","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("353","8","51","41","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("354","8","51","41","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("355","8","51","41","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("356","8","51","41","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("357","8","51","41","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("358","8","51","41","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("359","8","51","42","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("360","8","51","42","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("361","8","51","42","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("362","8","51","42","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("363","8","51","42","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("364","8","51","42","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("365","8","51","42","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-01","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("366","11","37","21","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("367","11","37","21","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("368","11","37","21","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("369","11","37","21","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("370","11","37","21","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("371","11","37","21","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("372","11","37","21","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("373","11","37","4","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("374","11","37","4","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("375","11","37","4","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("376","11","37","4","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("377","11","37","4","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("378","11","37","4","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("379","11","37","4","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("380","11","37","20","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("381","11","37","20","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("382","11","37","20","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("383","11","37","20","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("384","11","37","20","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("385","11","37","20","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("386","11","37","20","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("387","11","37","19","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("388","11","37","19","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("389","11","37","19","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("390","11","37","19","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("391","12","37","19","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("392","11","37","19","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("393","11","37","19","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("394","11","35","19","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("395","11","35","19","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("396","11","35","19","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("397","11","35","19","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("398","11","35","19","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("399","12","35","19","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("400","11","35","19","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("401","11","35","15","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("402","11","35","15","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("403","11","35","15","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("404","11","35","15","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("405","11","35","15","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("406","11","35","15","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("407","11","35","15","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("408","11","35","4","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("409","11","35","4","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("410","11","35","4","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("411","11","35","4","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("412","11","35","4","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("413","11","35","4","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("414","11","35","4","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("415","11","35","20","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("416","11","35","20","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("417","11","35","20","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("418","11","35","20","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("419","11","35","20","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("420","11","35","20","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("421","11","35","20","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("428","12","36","22","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("429","12","36","22","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("430","12","36","22","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("431","12","36","22","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("432","12","36","22","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("433","12","36","22","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("434","12","36","22","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("449","12","54","22","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("450","12","54","22","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("451","12","54","22","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("452","12","54","22","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02");
INSERT INTO relacion_tablas_ddec VALUES("453","12","54","22","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("455","12","54","22","40","12","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("456","12","49","22","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("457","12","49","22","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("458","12","49","22","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("459","12","49","22","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("460","12","49","22","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("461","12","49","22","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("462","12","49","22","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06");
INSERT INTO relacion_tablas_ddec VALUES("463","12","40","22","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("464","12","40","22","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("465","12","40","22","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("466","12","40","22","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("467","12","40","22","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("468","12","40","22","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("469","12","40","22","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("474","12","58","4","28","13","19","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("475","12","58","4","42","13","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("476","12","58","4","41","8","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("477","12","60","4","42","13","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("478","12","60","4","28","13","19","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("479","12","60","4","41","8","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("488","12","40","4","28","13","19","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("489","12","40","4","42","13","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("490","12","40","4","41","8","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("495","12","61","4","28","13","19","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("496","12","61","4","42","13","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("497","12","61","4","41","8","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("502","12","50","4","28","13","19","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("503","12","50","4","42","13","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("504","12","50","4","41","8","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("512","12","53","27","33","8","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("513","12","53","27","35","12","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("514","12","53","27","36","12","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("515","12","45","27","33","8","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("516","12","45","27","34","8","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("517","12","45","27","35","12","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("518","12","45","27","36","12","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("519","12","47","27","33","8","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("520","12","47","27","34","8","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("521","12","47","27","35","12","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("522","12","47","27","36","12","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("523","12","42","27","33","8","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("524","12","42","27","35","12","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("525","12","42","27","36","12","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-02","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("526","15","37","43","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("527","15","37","43","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("528","15","37","43","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("529","15","37","43","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("530","15","37","43","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("531","15","37","43","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("532","15","37","43","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04");
INSERT INTO relacion_tablas_ddec VALUES("533","15","37","43","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("534","15","37","43","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("535","15","37","43","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("536","15","37","43","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("537","15","37","43","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("538","15","37","43","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("539","15","37","43","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-04","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("540","15","37","44","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("541","15","37","44","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("542","15","37","44","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("543","15","37","44","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("544","15","37","44","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("545","15","37","44","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("546","15","37","44","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("547","15","37","44","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("548","15","37","44","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("549","15","37","44","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("550","15","37","44","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("551","15","37","44","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("552","15","37","44","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("553","15","37","44","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("554","15","37","45","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("555","15","37","45","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("556","15","37","45","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("557","15","37","45","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("558","15","37","45","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("559","15","37","45","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("560","15","37","45","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("561","15","37","45","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("562","15","37","45","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("563","15","37","45","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("564","15","37","45","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("565","15","37","45","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("566","15","37","45","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("567","15","37","45","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("568","15","37","46","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("569","15","37","46","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("570","15","37","46","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("571","15","37","46","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("572","15","37","46","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("573","15","37","46","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("574","15","37","46","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("575","15","37","46","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("576","15","37","46","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("577","15","37","46","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("578","15","37","46","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("579","15","37","46","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("580","15","37","46","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("581","15","37","46","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("582","15","37","47","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("583","15","37","47","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("584","15","37","47","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("585","15","37","47","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("586","15","37","47","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("587","15","37","47","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("588","15","37","47","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("589","15","37","47","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("590","15","37","47","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("591","15","37","47","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("592","15","37","47","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("593","15","37","47","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("594","15","37","47","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("595","15","35","43","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("596","15","35","43","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("597","15","35","43","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("598","15","35","43","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("599","15","35","43","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("600","15","35","43","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("601","15","35","43","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("602","15","35","43","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("603","15","35","43","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("604","15","35","43","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("605","15","35","43","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("606","15","35","43","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("607","15","35","43","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("608","15","35","44","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("609","15","35","44","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("610","15","35","44","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("611","15","35","44","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("612","15","35","44","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("613","15","35","44","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("614","15","35","44","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("615","15","35","44","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("616","15","35","44","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("617","15","35","44","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("618","15","35","44","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("619","15","35","44","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("620","15","35","44","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("621","15","35","44","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("622","15","35","45","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("623","15","35","45","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("624","15","35","45","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("625","15","35","45","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("626","15","35","45","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("627","15","35","45","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("628","15","35","45","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("629","15","35","45","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("630","15","35","45","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("631","15","35","45","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("632","15","35","45","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("633","15","35","45","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-05","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("634","15","35","45","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("635","15","35","45","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("636","15","35","46","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("637","15","35","46","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("638","15","35","46","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("639","15","35","46","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("640","15","35","46","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("641","15","35","46","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("642","15","35","46","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("643","15","35","46","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("644","15","35","46","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("645","15","35","46","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("646","15","35","46","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("647","15","35","46","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("648","15","35","46","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("649","15","35","46","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("650","15","35","47","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("651","15","35","47","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("652","15","35","47","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("653","15","35","47","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("654","15","35","47","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("655","15","35","47","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("656","15","35","47","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("657","15","35","47","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("658","15","35","47","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("659","15","35","47","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("660","15","35","47","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("661","15","35","47","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("662","15","35","47","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("663","15","35","47","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("664","12","50","22","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("665","12","50","22","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("666","12","50","22","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("667","12","50","22","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("668","12","50","22","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("670","12","50","22","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("671","12","58","22","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("672","12","58","22","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("673","12","58","22","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("674","12","58","22","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("675","12","58","22","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("676","12","58","22","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("677","12","58","22","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-06","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("678","12","54","4","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("679","12","54","4","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("680","12","54","4","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("681","12","54","4","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("682","12","54","4","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("683","12","54","4","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("684","12","54","4","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("685","8","50","33","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("686","8","50","33","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("687","8","50","33","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("688","8","50","33","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("689","8","50","33","38","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("690","12","54","60","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("691","12","54","60","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("692","12","54","60","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("693","12","54","60","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("694","12","54","60","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("695","12","54","60","39","12","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("697","12","50","60","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("698","12","50","60","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("699","12","50","60","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("700","12","50","60","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("701","12","50","60","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("702","12","50","60","39","12","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("703","12","50","60","40","12","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("704","12","36","60","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("705","12","36","60","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("706","12","36","60","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("707","12","36","60","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("708","12","36","60","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("709","12","36","60","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("710","12","36","60","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("711","12","40","60","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("712","12","40","60","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("713","12","40","60","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("714","12","40","60","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("715","12","40","60","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("716","12","40","60","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("717","12","40","60","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("718","12","49","60","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("719","12","49","60","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("720","12","49","60","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("721","12","49","60","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("722","12","49","60","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("723","12","49","60","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("724","12","49","60","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("725","12","58","60","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("726","12","58","60","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("727","12","58","60","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("728","12","58","60","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("729","12","58","60","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("730","12","58","60","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("731","12","58","60","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("732","9","54","7","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("733","9","54","7","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("734","9","54","7","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("735","9","54","7","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("736","9","54","7","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("737","9","54","7","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("738","9","54","7","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("739","15","51","49","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("740","15","51","49","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("741","15","51","49","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("742","15","51","49","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("743","15","51","49","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("744","15","51","49","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("745","15","51","49","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("746","15","51","49","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("747","15","51","49","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("748","15","51","49","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("749","15","51","49","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("750","15","51","49","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("751","15","51","49","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("752","15","51","50","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("753","15","51","50","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("754","15","51","50","26","17","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("755","15","36","48","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("756","15","36","48","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("757","15","36","48","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("758","15","36","48","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("759","15","36","48","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("760","15","36","48","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("761","15","36","48","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("762","15","36","49","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("763","15","36","49","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("764","15","36","49","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("765","15","36","49","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("766","15","36","49","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("767","15","36","49","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("768","15","36","49","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("769","15","36","50","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("770","15","36","50","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("771","15","36","50","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("772","15","36","50","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("773","15","36","50","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("774","15","36","50","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("775","15","36","50","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("776","15","36","51","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("777","15","36","51","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("778","15","36","51","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("779","15","36","51","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("780","15","36","51","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("781","15","36","51","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("782","15","36","51","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("783","15","49","48","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("784","15","49","48","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("785","15","49","48","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("786","15","49","48","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("787","15","49","48","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("788","15","49","48","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("789","15","49","48","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("790","15","49","49","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("791","15","49","49","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("792","15","49","49","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("793","15","49","49","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("794","15","49","49","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("795","15","49","49","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("796","15","49","49","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("797","15","49","50","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("798","15","49","50","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("799","15","49","50","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("800","15","49","50","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("801","15","49","50","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("802","15","49","50","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("803","11","49","50","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("804","15","49","51","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("805","15","49","51","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("806","15","49","51","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("807","15","49","51","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("808","15","49","51","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("809","15","49","51","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("810","15","49","51","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("811","15","40","48","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("812","15","40","48","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("813","15","40","48","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("814","15","40","48","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("815","15","40","48","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("816","15","40","48","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("817","15","40","48","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("818","15","40","49","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("819","15","40","49","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("820","15","40","50","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("821","15","40","50","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("822","15","40","50","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("823","15","40","50","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("824","15","40","50","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("825","15","40","51","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("826","15","40","51","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("827","15","40","51","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("828","15","40","51","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("829","15","40","51","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("830","15","40","51","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("831","15","40","51","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("832","15","58","48","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("833","15","58","48","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("834","15","58","48","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("835","15","58","48","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("836","15","58","48","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("837","15","58","48","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("838","15","58","48","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("839","15","58","49","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("840","15","58","49","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("841","15","58","49","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("842","15","58","49","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("843","15","58","49","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("844","15","58","49","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("845","15","58","49","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("846","15","58","50","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("847","15","58","50","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("848","15","58","50","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("849","15","58","50","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("850","15","58","50","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("851","15","58","50","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("852","15","58","50","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("853","15","58","51","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("854","15","58","51","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("855","15","58","51","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("856","15","58","51","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("857","15","58","51","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("858","15","58","51","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("859","15","58","51","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("860","15","59","52","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("861","15","59","52","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("862","15","59","52","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("863","15","59","52","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("864","15","59","52","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("865","15","59","52","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("866","15","59","52","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("867","15","59","52","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("868","15","59","52","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("869","15","59","52","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("870","15","59","52","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("871","15","59","52","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("872","15","59","52","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("873","15","59","52","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("874","15","59","53","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("875","15","59","53","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("876","15","59","53","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("877","15","59","53","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("878","15","59","53","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("879","15","59","53","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("880","15","59","53","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("881","15","59","53","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("882","15","59","53","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("883","15","59","53","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("884","15","59","53","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("885","15","59","53","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("886","15","59","53","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("887","15","59","54","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("888","15","59","54","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("889","15","59","54","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("890","15","59","54","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("891","15","59","54","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("892","15","59","54","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("893","15","59","54","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("894","15","59","54","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("895","15","59","54","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("896","15","59","54","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("897","15","59","54","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("898","15","59","54","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("899","15","59","54","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("900","15","59","54","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("901","15","59","55","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("902","15","59","55","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("903","15","59","55","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("904","15","59","55","34","8","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("905","15","59","55","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("906","15","59","55","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("907","15","59","55","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("908","15","59","55","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("909","15","59","55","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("910","15","59","55","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("911","15","59","55","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("912","15","59","55","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("913","15","59","55","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("914","15","59","55","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("915","15","59","56","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("916","15","59","56","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("917","15","59","56","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("918","15","59","56","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("919","15","59","56","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("920","15","59","56","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("921","15","59","56","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("922","15","59","56","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("923","15","59","56","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("924","15","59","56","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("925","15","59","56","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("926","15","59","56","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("927","15","59","56","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("928","15","59","56","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("929","15","59","57","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07");
INSERT INTO relacion_tablas_ddec VALUES("930","15","59","57","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("931","15","59","57","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("932","15","59","57","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("933","15","59","57","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("934","15","59","57","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("935","15","59","57","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("936","15","59","57","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("937","15","59","57","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("938","15","59","57","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("939","15","59","57","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("940","15","59","57","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("941","15","59","57","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("942","15","59","57","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("943","15","59","58","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("944","15","59","58","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("945","15","59","58","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("946","15","59","58","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("947","15","59","58","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("948","15","59","58","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("949","15","59","58","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("950","15","59","58","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("951","15","59","58","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("952","15","59","58","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("953","15","59","58","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("954","15","59","58","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("955","15","59","58","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("956","15","59","58","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("957","15","59","59","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("958","15","59","59","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("959","15","59","59","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("960","15","59","59","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("961","15","59","59","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("962","15","59","59","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("963","15","59","59","32","19","20","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("964","15","59","59","19","21","27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("965","15","59","59","20","28","37","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("966","15","59","59","21","38","47","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("967","15","59","59","22","48","57","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("968","15","59","59","23","58","67","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("969","15","59","59","24","68","77","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("970","15","59","59","25","78","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("971","9","45","7","34","8","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("972","9","47","7","35","12","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("973","9","47","7","33","8","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("974","13","35","13","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("975","13","35","13","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("976","13","35","13","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("977","13","35","13","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("978","13","35","13","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("979","13","35","13","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("980","13","35","13","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("981","13","35","13","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("982","13","35","13","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("983","13","35","14","8","8","8","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("984","13","35","14","9","9","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("985","13","35","14","10","10","10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("986","13","35","14","11","11","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("987","13","35","14","12","12","12","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("988","13","35","14","13","13","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10");
INSERT INTO relacion_tablas_ddec VALUES("989","13","35","14","14","14","14","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("990","13","35","14","15","15","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("991","13","35","14","16","16","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-10","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("992","12","36","22","39","12","18","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("993","12","36","22","40","12","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("994","12","36","22","5","16","16","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("995","12","36","22","4","14","15","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("996","12","36","22","3","12","13","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("997","12","36","22","2","10","11","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("998","12","36","22","1","8","9","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("999","12","60","60","40","12","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("1000","12","60","60","39","12","18","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("1001","12","60","60","5","16","16","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("1002","12","36","60","4","14","15","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1003","12","36","60","3","12","13","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1004","12","36","60","2","10","11","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1005","12","36","60","1","8","9","99991","Donatware","Programas","99999","DONATWARE","2024-02-07","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1006","12","40","22","40","12","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1007","12","40","22","39","12","18","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("1008","12","40","22","5","16","16","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1009","12","40","22","4","14","15","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1010","12","40","22","3","12","13","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1011","12","40","22","2","10","11","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1012","12","40","22","1","8","9","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1013","12","54","22","39","12","18","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1014","12","49","22","40","12","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1015","12","49","22","39","12","18","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1016","12","49","22","5","16","16","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1017","12","49","22","4","14","15","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1018","12","49","22","3","12","13","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1019","12","49","22","2","10","11","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1020","12","49","22","1","8","9","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1021","12","58","22","40","12","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1022","12","58","22","39","12","18","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1023","12","58","22","5","16","16","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1024","12","58","22","4","14","15","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1025","12","58","22","3","12","13","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1026","12","58","22","2","10","11","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1027","12","58","22","1","8","9","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1028","12","50","22","40","12","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1029","12","50","22","39","12","18","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1030","12","40","60","40","12","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1031","12","40","60","39","12","18","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1032","12","40","60","5","16","16","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1033","12","40","60","4","14","15","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1034","12","40","60","3","12","13","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1035","12","40","60","2","10","11","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1036","12","40","60","1","8","9","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1037","12","54","60","40","12","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1038","12","61","60","40","12","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("1039","12","61","60","39","12","18","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("1040","12","61","60","5","16","16","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("1041","12","49","60","4","14","15","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1042","12","49","60","3","12","13","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1043","12","49","60","2","10","11","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1044","12","49","60","1","8","9","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1045","12","58","60","39","12","18","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1046","12","58","60","40","12","99","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","99991","Donatware","Programas","99999","DONATWARE","2024-02-08");
INSERT INTO relacion_tablas_ddec VALUES("1047","12","58","60","5","16","16","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1048","12","58","60","4","14","15","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1049","12","58","60","3","12","13","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1050","12","58","60","2","10","11","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1051","12","58","60","1","8","9","99991","Donatware","Programas","99999","DONATWARE","2024-02-08","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1052","9","35","61","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1053","9","35","61","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21");
INSERT INTO relacion_tablas_ddec VALUES("1054","9","35","61","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1055","9","35","61","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1056","9","35","61","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1057","9","35","61","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1058","9","35","61","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1059","9","35","62","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1060","9","35","62","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1061","9","35","62","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21");
INSERT INTO relacion_tablas_ddec VALUES("1062","9","35","62","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21");
INSERT INTO relacion_tablas_ddec VALUES("1063","9","35","62","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1064","9","35","62","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1065","9","35","62","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1066","6","35","36","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1067","6","35","36","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1068","6","35","36","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21");
INSERT INTO relacion_tablas_ddec VALUES("1069","6","35","36","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21");
INSERT INTO relacion_tablas_ddec VALUES("1070","6","35","36","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21");
INSERT INTO relacion_tablas_ddec VALUES("1071","6","35","36","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21");
INSERT INTO relacion_tablas_ddec VALUES("1072","6","35","36","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1073","6","35","37","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1074","6","35","37","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1075","6","35","37","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1076","6","35","37","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1077","6","35","37","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1078","6","35","37","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1079","6","35","37","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1080","9","60","7","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO relacion_tablas_ddec VALUES("1081","9","60","7","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO relacion_tablas_ddec VALUES("1082","9","60","7","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO relacion_tablas_ddec VALUES("1083","9","60","7","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO relacion_tablas_ddec VALUES("1084","9","60","7","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO relacion_tablas_ddec VALUES("1085","9","60","7","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO relacion_tablas_ddec VALUES("1086","9","60","7","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");
INSERT INTO relacion_tablas_ddec VALUES("1087","9","40","7","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1088","9","40","7","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1089","9","40","7","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1090","9","40","7","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1091","9","40","7","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1092","9","40","7","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21");
INSERT INTO relacion_tablas_ddec VALUES("1093","9","40","7","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-21","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1094","9","61","7","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1095","9","61","7","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1096","9","61","7","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1097","9","61","7","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1098","9","61","7","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1099","9","61","7","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1100","9","61","7","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1101","9","58","7","1","8","9","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1102","9","58","7","2","10","11","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1103","9","58","7","3","12","13","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1104","9","58","7","4","14","15","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1105","9","58","7","5","16","16","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1106","9","58","7","6","17","18","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","0","","","0","","0000-00-00");
INSERT INTO relacion_tablas_ddec VALUES("1107","9","58","7","7","19","99","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-22");



DROP TABLE IF EXISTS tecnicos;

CREATE TABLE `tecnicos` (
  `id_tecnicos` int(11) NOT NULL AUTO_INCREMENT,
  `licencia` bigint(20) DEFAULT NULL,
  `funciontecnico` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `sexotecnico` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `apellidotecnico` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `nombretecnico` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechanactecnico` date DEFAULT NULL,
  `dnitecnico` bigint(20) DEFAULT NULL,
  `emailtecnico` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `telefono` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cuit1` bigint(20) DEFAULT NULL,
  `cuit2` bigint(20) DEFAULT NULL,
  `cuit3` bigint(20) DEFAULT NULL,
  `especialidadtecnico` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `categoriatecnico` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_tecnicos`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO tecnicos VALUES("17","29753800","TECNICO","FEMENINO","Sudini","Barbara","1982-09-18","29753800","barbara.sudini@gmail.com","1136710105","10001","10016","0","LIBRE","UFLO","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","236602921","Sandra","Barzola","9999999999","2024-01-14","FEDERACION RIOPLATENSE DE PATIN (FPR)");
INSERT INTO tecnicos VALUES("18","22087623","TECNICO","FEMENINO","Saldaño","Carolina","1970-12-01","22087623","saldanocarolinam@gmail.com","1155014051","10002","0","0","LIBRE","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("19","16496479","TECNICO","MASCULINO","Barimboin","Gustavo","1963-10-12","16496479","guso_cb@hotmail.com","1133257227","10002","0","0","FIGURAS OBLIGATORIAS","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","236602921","Sandra","Barzola","9999999999","2024-01-10","FEDERACION RIOPLATENSE DE PATIN (FPR)");
INSERT INTO tecnicos VALUES("20","26371398","TECNICO","FEMENINO","Cerbino","Maria Georgina","1977-11-23","26371398","georginacerbino@hotmail.com","1133114200","10002","0","0","LIBRE - DANZA - SHOW","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("21","25133499","TECNICO","MASCULINO","Iglesias","Walter","1976-06-28","25133499","walteriglesias11@gmail.com","1140817796","10009","9999999999","0","LIBRE","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","236602921","Sandra","Barzola","9999999999","2023-12-31","FEDERACION RIOPLATENSE DE PATIN (FPR)");
INSERT INTO tecnicos VALUES("22","21648918","TECNICO","MASCULINO","Pasini","Gaston","1970-09-18","21648918","gastonpasini@yahoo.com.ar","1156027123","10009","9999999999","0","DANZA","UFLO","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","236602921","Sandra","Barzola","9999999999","2023-12-31","FEDERACION RIOPLATENSE DE PATIN (FPR)");
INSERT INTO tecnicos VALUES("23","22411705","TECNICO","FEMENINO","Ardanaz","Cecilia","1972-03-17","22411705","Cecilia.granate@yahoo.com","1130218908","10016","0","0","DANZA-LIBRE","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","23660292","Sandra","Barzola","9999999999","2023-12-26","FEDERACION RIOPLATENSE DE PATIN (FPR)");
INSERT INTO tecnicos VALUES("24","32196454","TECNICO","FEMENINO","Canario","Viviana","1986-02-18","32196454","vivianacanario@gmail.com","1132903627","10022","0","0","LIBRE","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","236602921","Sandra","Barzola","9999999999","2023-12-31","FEDERACION RIOPLATENSE DE PATIN (FPR)");
INSERT INTO tecnicos VALUES("25","41883647","TECNICO","FEMENINO","Cantarelli","Greta","1999-06-12","41883647","gretacantarelli22@gmail.com","2216314119","10006","0","0","LIBRE - IN LINE","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("26","22284470","TECNICO","FEMENINO","Ciardello","Natalia","1971-05-19","22284470","Naty1905@hotmail.com","1130779600","10022","0","0","LIBRE","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","23660292","Sandra","Barzola","9999999999","2023-12-26","FEDERACION RIOPLATENSE DE PATIN (FPR)");
INSERT INTO tecnicos VALUES("27","32542188","TECNICO","FEMENINO","Minicucci","Gissel","1985-09-02","32542188","gisselminicucci@hotmail.com","1131744761","10023","0","0","LIBRE","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("28","36778262","TECNICO","FEMENINO","Papoff","Ana Carolina","1992-02-27","36778262","carolinapapoff@gmail.com","2214342495","10011","0","0","LIBRE","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","236602921","Sandra","Barzola","9999999999","2024-01-13","FEDERACION RIOPLATENSE DE PATIN (FPR)");
INSERT INTO tecnicos VALUES("29","36169579","TECNICO","FEMENINO","Barrios","Ailen","1991-06-05","36169579","patinab.luisguillon@gmail.com","1135717207","10016","0","0","LIBRE","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("30","16607355","TECNICO","MASCULINO","Figuera","Daniel","1963-11-24","16607355","alianzadanifiguera@hotmail.com","1155952057","10021","0","0","LIBRE","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","236602921","Sandra","Barzola","9999999999","2024-01-14","FEDERACION RIOPLATENSE DE PATIN (FPR)");
INSERT INTO tecnicos VALUES("31","26577108","TECNICO","MASCULINO","Cal","Pablo","1978-04-30","26577108","Pablo_cal@yahoo.com.ar","1154078980","10002","0","0","DANZA","INTERNACIONAL","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","236602921","Sandra","Barzola","9999999999","2023-12-31","FEDERACION RIOPLATENSE DE PATIN (FPR)");
INSERT INTO tecnicos VALUES("33","31776870","TECNICO","FEMENINO","Vanzulli","Leila Jael","1900-12-31","31776870","leluvan1@hotmail.com","1161531774","10024","0","0","LIBRE","UFLO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","236602921","Sandra","Barzola","9999999999","2024-01-13","FEDERACION RIOPLATENSE DE PATIN (FPR)");
INSERT INTO tecnicos VALUES("34","45317911","TECNICO","MASCULINO","Rodriguez Giusto","Lautaro","1900-12-31","45317911","lep.firma@gmail.com","1124950909","10024","0","0","LIBRE","UFLO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("35","27236262","TECNICO","FEMENINO","Torres","Maria Fernanda","1979-05-15","27236262","mfertorres@hotmail.com","2215409309","10008","0","0","LIBRE/DANZA","NACIONAL A","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("36","40227211","TECNICO","MASCULINO","Prieto","Luciano","1997-04-13","40227211","lucianoalbertoprieto1977@gmail.com","1133360284","10008","0","0","LIBRE/DANZA","NACIONAL","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("37","32522213","TECNICO","FEMENINO","Baptista","Noelia","1900-12-31","32522213","noe.baptista@hotmail.com.ar","57271046","10017","0","0","LIBRE","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("38","35364631","TECNICO","FEMENINO","Vitale","Marianela","1990-10-26","35364631","marian.vit@hotmail.com","1133375392","10007","0","0","LIBRE/ESCUELA","A","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("39","39429666","TECNICO","FEMENINO","Zerbi","Maria Eugenia","1900-12-31","39429666","maru.zerbi@hotmail.com","1164811929","10020","0","0","","UFLO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("40","35760738","TECNICO","FEMENINO","Holik","Micaela","1900-12-31","35760738","micaelajohanna.holik@gmail.com","1128076783","10015","0","0","LIBRE","NACIONAL","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("41","42827187","TECNICO","FEMENINO","Figueroa","Emilia","1900-12-31","42827187","figueroaemilia00@gmail.com","2214091749","10011","0","0","LIBRE","C","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("42","40901330","TECNICO","FEMENINO","Fiasche","Camila","1900-12-31","40901330","camilafiasche@gmail.com","1149723468","10003","0","0","LIBRE","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("43","17710827","TECNICO","FEMENINO","Batista","Norma","1900-12-31","17710827","normabatista2015@hotmail.com","173631838","10004","0","0","LIBRE","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("44","39587141","TECNICO","FEMENINO","Micaela Belen","Schmidt","1996-04-25","39587141","micaelaschmidt96@yahoo.com.ar","1130710974","10014","0","0","LIBRE","UFLO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("45","39171656","TECNICO","FEMENINO","Pollero","Florencia","1995-08-05","39171656","fiorepollero@gmail.com","61787292","10018","0","0","LIBRE","ESCUELA ARGENTINA","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("46","26311977","TECNICO","FEMENINO","Attorresi","Vanina","1900-12-31","26311977","Vaninaatto@hotmail.com","","10019","0","0","LIBRE","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","0000-00-00","");
INSERT INTO tecnicos VALUES("47","30434292","TECNICO","FEMENINO","Di Pascuasio","Yanina Valeria","1900-12-31","30434292","x@x.com","","10025","0","0","LIBRE","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-30","0","","","0","0000-00-00","");



DROP TABLE IF EXISTS test;

CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuit` bigint(100) NOT NULL,
  `tipo_comprobante` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `num_comprobante` bigint(100) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `concepto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `num_comp_pago` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `forma_pago` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `entidad_pago` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `adeudado` bigint(100) DEFAULT NULL,
  `pagado` bigint(100) DEFAULT NULL,
  `saldo` bigint(100) DEFAULT NULL,
  `img_comp_pago` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `dnipatinador` bigint(20) DEFAULT NULL,
  `tipolicencia` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `comentarios` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




DROP TABLE IF EXISTS tipolicencias;

CREATE TABLE `tipolicencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipolicencia` varchar(100) COLLATE utf8_bin NOT NULL,
  `valor` bigint(100) DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO tipolicencias VALUES("25","RUD","15000","23660292","Sandra Del Valle","Barzola","11222333","LEPAA","2022-07-26","23660292","Sandra","Barzola","11111111111","LEPAA","2023-12-16");
INSERT INTO tipolicencias VALUES("26","NACIONAL","50000","23660292","Sandra Del Valle","Barzola","11222333","LEPAA","2022-07-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31");
INSERT INTO tipolicencias VALUES("27","PROMOCIONAL","45000","23660292","Sandra Del Valle","Barzola","11222333","LEPAA","2022-07-26","23660292","Sandra","Barzola","11111111111","LEPAA","2023-12-16");
INSERT INTO tipolicencias VALUES("31","CAP INVITADOS","0","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-18","0","","","0","","0000-00-00");
INSERT INTO tipolicencias VALUES("32","ADAPTADOS","0","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-27","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-27");



DROP TABLE IF EXISTS torneo;

CREATE TABLE `torneo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombretorneo` varchar(255) COLLATE utf8_bin NOT NULL,
  `valor` bigint(100) DEFAULT NULL,
  `estadotorneo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `fechatorneo` varchar(100) COLLATE utf8_bin NOT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` text COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO torneo VALUES("42","RIO. Divisional A y WS. Campeonato Rioplatense","18000","Cerrado","","251334991","Walter","Iglesias","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-09","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19");
INSERT INTO torneo VALUES("43","SELECTIVO. Divisional B. Copa Apertura","18000","Cerrado","","251334991","Walter","Iglesias","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-09","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19");
INSERT INTO torneo VALUES("44","CAP. Copa Apertura A y WS","40000","Cerrado","","251334991","Walter","Iglesias","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-09","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19");
INSERT INTO torneo VALUES("45","GASTOS OPERATIVOS. CAP. Copa Apertura A y WS","25000","Cerrado","","251334991","Walter","Iglesias","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-09","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-19");
INSERT INTO torneo VALUES("46","CAP. Revision","40000","Abierto","","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-20","0","","","0","","0000-00-00");



DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_bin NOT NULL,
  `apellido` varchar(100) COLLATE utf8_bin NOT NULL,
  `domicilio` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `localidad` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `partido` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `telefono` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `acceso` varchar(50) COLLATE utf8_bin NOT NULL,
  `cuit` bigint(20) NOT NULL,
  `dni` bigint(20) NOT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL,
  `estadoacceso` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `dnialta` bigint(20) DEFAULT NULL,
  `nombrealta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidoalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitalta` bigint(20) DEFAULT NULL,
  `institucionalta` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `dnimod` bigint(20) DEFAULT NULL,
  `nombremod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `apellidomod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cuitmod` bigint(20) DEFAULT NULL,
  `institucionmod` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fechamod` date DEFAULT NULL,
  PRIMARY KEY (`dni`) USING BTREE,
  KEY `id` (`id`),
  KEY `cuit` (`cuit`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`cuit`) REFERENCES `clubs` (`cuit`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO users VALUES("81","Daniel","Figuera","","","","","alianzadanifiguera@hotmail.com","tecnico","10021","16607355","1234","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO users VALUES("50","Liliana","Camacho","","","","","lily_camacho@yahoo.com.ar","administrador","9999999999","16762606","123","DESBLOQUEADO","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN","2023-12-18","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26");
INSERT INTO users VALUES("77","Norma","Batista","","","","","normabatista2015@hotmail.com","tecnico","10004","17710827","1234","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO users VALUES("71","Karina Alejandra","Ceballos","","","","","patinadores.aajj@gmail.com","delegado","10002","23192306","sealja21","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13","0","","","0","","0000-00-00");
INSERT INTO users VALUES("87","Greta Cloe","Cantarelli","","","","","X@X.COM","tecnico","10006","23208053","1972","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE (FPR)","2024-02-15","0","","","0","","0000-00-00");
INSERT INTO users VALUES("26","Sandra","Barzola","Colon 2140","Lomas del Mirador","La Matanza","0","lepaa@outlook.com.ar","delegado","10016","23660292","279961","DESBLOQUEADO","0","","","0","","0000-00-00","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14");
INSERT INTO users VALUES("66","Walter","Iglesias","","","","","walteriglesias11@gmail.com","tecnico","10009","25133499","lanus1976","DESBLOQUEADO","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31");
INSERT INTO users VALUES("80","Vanina","Attorresi","","","","","Vaninaatto@hotmail.com","tecnico","10019","26311977","1234","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO users VALUES("72","Romina Bernardette","Carmona","","","","","patincatartisico@gmail.com","delegado","10022","26328130","vivi","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13","0","","","0","","0000-00-00");
INSERT INTO users VALUES("84","Maria Fernanda","Torres","","","","","mfertorres@hotmail.com","tecnico","10008","27236262","1234","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO users VALUES("75","Barbara","Sudini","","","","","barbara.sudini@gmail.com","tecnico","10001","29753800","378577","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO users VALUES("86","Yanina Valeria","Di Pascuasio","","","","","x@x.com","tecnico","10025","30434292","1234","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-30","0","","","0","","0000-00-00");
INSERT INTO users VALUES("85","Leila Jael","Vanzulli","","","","","leluvan1@hotmail.com","tecnico","10024","31776870","3101","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO users VALUES("82","Gissel","Minicucci","","","","","gisselminicucci@hotmail.com","tecnico","10023","32542188","1234","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO users VALUES("83","Marianela","Vitale","","","","","marian.vit@hotmail.com","tecnico","10007","35364631","1234","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO users VALUES("70","Micaela","Holik","","","","","micaelajohanna.holik@gmail.com","tecnico","10015","35760738","1234","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12","16762606","Liliana","Camacho","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-31");
INSERT INTO users VALUES("73","Ana Carolina","Papoff","","","","","carolinapapoff@gmail.com","tecnico","10011","36778262","epac.cb.2024","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13","0","","","0","","0000-00-00");
INSERT INTO users VALUES("79","Florencia","Pollero","","","","","fiorepollero@gmail.com","tecnico","10018","39171656","agosrimolo13","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO users VALUES("68","Ayrton","Rueda","","","","","Ayrton_rueda@hotmail.com","delegado","10017","39388663","Lolo2406","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12","0","","","0","","0000-00-00");
INSERT INTO users VALUES("69","Maria Eugenia","Zerbi","","","","","maru.zerbi@hotmail.com","tecnico","10020","39429666","1234","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-12","0","","","0","","0000-00-00");
INSERT INTO users VALUES("78","Schmidt","Micaela Belen","","","","","micaelaschmidt96@yahoo.com.ar","tecnico","10014","39587141","iriarte1337","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO users VALUES("76","Camila","Fiasche","","","","","camilafiasche@gmail.com","tecnico","10003","40901330","1234","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-14","0","","","0","","0000-00-00");
INSERT INTO users VALUES("74","Rocio Abril","Cacciato","","","","","lepaa@outlook.com.ar","delegado","10016","41588243","1234","DESBLOQUEADO","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2024-01-13","0","","","0","","0000-00-00");
INSERT INTO users VALUES("61","Gaston","Pasini","","","","","gastonpasini@yahoo.com.ar","administrador","9999999999","216489181","123","DESBLOQUEADO","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31");
INSERT INTO users VALUES("67","Sandra","Barzola","","","","","sbarzola@outlook.com","administrador","9999999999","236602921","279961","DESBLOQUEADO","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","23660292","Sandra","Barzola","10016","LEPAA (LEPAA)","2023-12-26");
INSERT INTO users VALUES("58","Walter","Iglesias","","","","","walteriglesias11@gmail.com","administrador","9999999999","251334991","123","DESBLOQUEADO","23660292","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-26","236602921","Sandra","Barzola","9999999999","FEDERACION RIOPLATENSE DE PATIN (FPR)","2023-12-31");



SET FOREIGN_KEY_CHECKS=1;