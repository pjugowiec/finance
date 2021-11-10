package com.server.admin.model;


import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

public record RegisterRequest(@NotNull @Length(min = 4) @Email String email, @NotNull @Length(min = 8) String password) {
}
