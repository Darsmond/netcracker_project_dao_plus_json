CREATE TABLE "OBJECTS" (
	"object_id" serial NOT NULL,
	"object_type_id" bigint NOT NULL,
	"name" character varying NOT NULL,
	CONSTRAINT OBJECTS_pk PRIMARY KEY ("object_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "OBJECT_TYPES" (
	"object_type_id" serial NOT NULL,
	"name" character varying NOT NULL,
	CONSTRAINT OBJECT_TYPES_pk PRIMARY KEY ("object_type_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "ATTRIBUTES" (
	"attr_id" serial NOT NULL,
	"attr_type_id" bigint NOT NULL,
	"name" character varying NOT NULL,
	"def_value" character varying,
	CONSTRAINT ATTRIBUTES_pk PRIMARY KEY ("attr_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "ATTR_OBJECT_TYPES" (
	"attr_id" bigint NOT NULL,
	"object_type_id" bigint NOT NULL,
	"options" bigint NOT NULL
) WITH (
  OIDS=FALSE
);

CREATE TABLE "REFERENCES" (
	"attr_id" bigint NOT NULL,
	"reference" bigint NOT NULL,
	"object_id" bigint NOT NULL
) WITH (
  OIDS=FALSE
);

CREATE TABLE "ATTR_TYPES" (
	"attr_type_id" serial NOT NULL,
	"name" character varying NOT NULL,
	CONSTRAINT ATTR_TYPES_pk PRIMARY KEY ("attr_type_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "PARAMS" (
	"attr_id" bigint NOT NULL,
	"object_id" bigint NOT NULL,
	"value" character varying,
	"date_value" timestamptz
) WITH (
  OIDS=FALSE
);

ALTER TABLE "OBJECTS" ADD CONSTRAINT "OBJECTS_fk0" FOREIGN KEY ("object_type_id") REFERENCES "OBJECT_TYPES"("object_type_id");

ALTER TABLE "ATTRIBUTES" ADD CONSTRAINT "ATTRIBUTES_fk0" FOREIGN KEY ("attr_type_id") REFERENCES "ATTR_TYPES"("attr_type_id");

ALTER TABLE "ATTR_OBJECT_TYPES" ADD CONSTRAINT "ATTR_OBJECT_TYPES_fk0" FOREIGN KEY ("attr_id") REFERENCES "ATTRIBUTES"("attr_id");
ALTER TABLE "ATTR_OBJECT_TYPES" ADD CONSTRAINT "ATTR_OBJECT_TYPES_fk1" FOREIGN KEY ("object_type_id") REFERENCES "OBJECT_TYPES"("object_type_id");

ALTER TABLE "REFERENCES" ADD CONSTRAINT "REFERENCES_fk0" FOREIGN KEY ("attr_id") REFERENCES "ATTRIBUTES"("attr_id");
ALTER TABLE "REFERENCES" ADD CONSTRAINT "REFERENCES_fk1" FOREIGN KEY ("reference") REFERENCES "OBJECTS"("object_id");
ALTER TABLE "REFERENCES" ADD CONSTRAINT "REFERENCES_fk2" FOREIGN KEY ("object_id") REFERENCES "OBJECTS"("object_id");


ALTER TABLE "PARAMS" ADD CONSTRAINT "PARAMS_fk0" FOREIGN KEY ("attr_id") REFERENCES "ATTRIBUTES"("attr_id");
ALTER TABLE "PARAMS" ADD CONSTRAINT "PARAMS_fk1" FOREIGN KEY ("object_id") REFERENCES "OBJECTS"("object_id");

INSERT INTO public."OBJECT_TYPES"(
            object_type_id, name)
    VALUES 
			(1, 'Role'), 
			(2, 'Administrator'), 
			(3, 'Owner'), 
			(4, 'User'),
			(5, 'Parking'),
			(6, 'Parking_spot')
;

INSERT INTO public."OBJECTS"(
            object_id, object_type_id, name)
    VALUES 
			(1, 1, 'Administrator'),
			(2, 1, 'Owner'),
			(3, 1, 'User'),
			(4, 4, 'User1'),
			(5, 4, 'User2'),
			(6, 1, 'Admin1')	
	;
	
INSERT INTO public."ATTR_TYPES"(
            attr_type_id, name)
    VALUES 
			(1, 'Number'), 
			(2, 'Text'), 
			(3, 'Date'), 
			(4, 'Reference')
;
	
INSERT INTO public."ATTRIBUTES"(
            attr_id, attr_type_id, name, def_value)
    VALUES 
	(400, 4, 'role_id', 4),
	(401, 2, 'fio', null),
	(402, 2, 'phone', null),
	(403, 2, 'email', null),
	(404, 2, 'password', null),
	(405, 2, 'address', null),
	(406, 3, 'birthdate', null),
	(301, 1, 'inn', null),
	(302, 2, 'organization_name', null),
	(501, 1, 'parking_id', null),
	(502, 1, 'latitude', null),
	(503, 1, 'longitude', null),
	(504, 2, 'parking_address', null),
	(505, 1, 'price', null),
	(506, 3, 'open_time', null),
	(507, 1, 'close_time', null),
	(508, 1, 'description', null),
	(601, 1, 'parking_spot_id', null),
	(602, 1, 'description', null)
;
	 
INSERT INTO public."REFERENCES"(
            attr_id, reference, object_id)
    VALUES 
		(400, 1, 6),
		(400, 3, 4),
		(400, 3, 5)
;
		
INSERT INTO public."PARAMS"(
            attr_id, object_id, value, date_value)
    VALUES 
		(401, 4,'Иванов', null),
		(402, 4,'+780065423', null),
		(403, 4,'mail@gmail.com', null),
		(404, 4,'adfages7ScxQ', null),
		(405, 4,'Воронеж', null),
		(406, 4, null, '1981-11-23'),
		(401, 5,'Соколов', null),
		(402, 5,'+79501231233', null),
		(403, 5,'sok@yandex.ru', null),
		(404, 5,'qEsdqq123sda', null),
		(405, 5,'Moscow', null),
		(406, 5, null,'1995-01-10')
;

INSERT INTO public."ATTR_OBJECT_TYPES"(
            attr_id, object_type_id, options)
    VALUES 
			(400, 4, 0),
			(401, 4, 0),
			(402, 4, 0),
			(403, 4, 0),
			(404, 4, 0),
			(405, 4, 0),
			(406, 4, 0),
			(501, 5, 0),
			(502, 5, 0),
			(503, 5, 0),
			(504, 5, 0)
			
;