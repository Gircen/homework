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
    @Id
    @Column(name = "id")
    private int id;
    @Column(name="model")
    private String model;
    @Column(name="release_date")
    @Temporal(TemporalType.DATE)
    private Date releaseDate;
    @Column(name = "engine_displacement")
    private Double engineDisplacement;
    @Column
    private Double turbocharger;
    @Column
    private Double horsepower;
    @OneToOne(targetEntity = Brand.class)
    private Brand brand;
//    @OneToOne(targetEntity = TransmissionCar.class)
//    private TransmissionCar transmissionCar;
    @OneToOne(targetEntity = Drive.class)
    private Drive drive;
//    @OneToOne(targetEntity = Colours.class)
//    private Colours colours;


}
