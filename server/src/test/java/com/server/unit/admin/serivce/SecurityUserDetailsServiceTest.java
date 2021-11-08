package com.server.unit.admin.serivce;

import com.server.admin.entity.UserEntity;
import com.server.admin.model.Role;
import com.server.admin.repository.UserRepository;
import com.server.admin.service.SecurityUserDetailsService;
import com.server.admin.util.AdminErrorsMessages;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@ExtendWith(MockitoExtension.class)
class SecurityUserDetailsServiceTest {

    private SecurityUserDetailsService securityUserDetailsService;

    @Mock
    private UserRepository userRepository;

    @BeforeEach
    void init() {
        securityUserDetailsService = new SecurityUserDetailsService(userRepository);
    }

    @Test
    void loadUserByUsername_UserNotFound_ShouldThrowException() {
        UsernameNotFoundException exception =
                assertThrows(UsernameNotFoundException.class, () -> securityUserDetailsService.loadUserByUsername("NOT EXIST"));

        assertEquals(AdminErrorsMessages.USER_NOT_FOUND.name(), exception.getMessage());
    }

    @Test
    void loadUserByUsername_UserExists_ShouldReturnUser() {
        final String email = "EXISTS@EXISTS";
        Mockito.when(userRepository.findByEmail(email))
                .thenReturn(java.util.Optional.of(new UserEntity(1L, email, "1234", Role.ADMIN)));

        UserDetails userDetails = securityUserDetailsService.loadUserByUsername(email);

        assertEquals(email, userDetails.getUsername());
        assertEquals("1234", userDetails.getPassword());


    }


}
