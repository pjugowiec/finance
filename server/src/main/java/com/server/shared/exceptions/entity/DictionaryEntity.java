package com.server.shared.exceptions.entity;

import javax.persistence.*;

import static javax.persistence.GenerationType.SEQUENCE;

@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "type", discriminatorType = DiscriminatorType.STRING, length = 50)
@Entity(name = "dictionaries")
public class DictionaryEntity {

    @Id
    @SequenceGenerator(name = "dictionary_seq", sequenceName = "dictionary_seq", allocationSize = 1)
    @GeneratedValue(strategy = SEQUENCE, generator = "dictionary_seq")
    private Long id;

    @Column(name = "value")
    private String value;

}
