package ru.homework.cars.server.data.classes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import java.util.List;
import java.util.Map;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
public class FullLoad {
    private List<String> dateYear;
    private Map<String,String> dateMonth;
    @Column(name="cars")
    private List<Cars> cars;



}
