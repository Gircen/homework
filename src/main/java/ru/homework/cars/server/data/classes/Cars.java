package ru.homework.cars.server.data.classes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Formula;
import org.hibernate.annotations.NaturalId;
import ru.homework.cars.server.data.AbstractEntity;

import javax.persistence.*;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
@Table(schema = "cars", name = "cars")
public class Cars extends AbstractEntity {
    //    id serial NOT NULL, -- Идентификатор машины
//    model character varying NOT NULL DEFAULT ''::character varying, -- Модель автомобиля
//    release_date date NOT NULL DEFAULT '1980-01-01'::date, -- Дата выпуска
//    engine_displacement double precision NOT NULL DEFAULT 0.0, -- Рабочий объём двигателя
//    turbocharger boolean NOT NULL DEFAULT false, -- Наличие турбонагнетателя
//    horsepower double precision NOT NULL DEFAULT 0.0, -- Лошадиная сила
//    brand_id integer NOT NULL, -- Идентификатор марки
//    transmission_id integer NOT NULL, -- Идентификатор трансмиссии
//    drive_id integer NOT NULL, -- Идентификатор привода машины
//    body_id integer NOT NULL, -- Идентификатор кузова
//    colour_id integer NOT NULL, -- Идентификатор цвета
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id")
    private int id;
    @NaturalId
    @Column
    private String model;
    @Formula("to_char(release_date,'YYYY')")
    private String yearDate;
    @Formula("to_char(release_date,'MM')")
    private String monthDate;
    @Column(name = "engine_displacement")
    private double engineDisplacement;
    @Column
    private boolean turbocharger;
    @Column
    private double horsepower;
    @OneToOne
    private Brand brand;
    @OneToOne
    private TransmissionCar transmissionCar;
    @OneToOne
    private Drive drive;
    @OneToOne
    private Colours colours;


}
