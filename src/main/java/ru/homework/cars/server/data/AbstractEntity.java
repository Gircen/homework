package ru.homework.cars.server.data;

import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import ru.homework.cars.server.data.classes.*;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.PROPERTY, property = "classesType")
@JsonSubTypes({
        @JsonSubTypes.Type(value = Body.class, name = "body"),
        @JsonSubTypes.Type(value = Brand.class, name = "brand"),
        @JsonSubTypes.Type(value = Cars.class, name = "cars"),
        @JsonSubTypes.Type(value = Colours.class, name = "colours"),
        @JsonSubTypes.Type(value = Drive.class, name = "drive"),
        @JsonSubTypes.Type(value = TransmissionCar.class, name = "transmissionCar"),

})
public abstract class AbstractEntity implements Serializable {
    private int id;

}
