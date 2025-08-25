package com.kepco.app.core.config;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springdoc.core.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@OpenAPIDefinition
public class SwaggerConfig {

    @Bean
    public OpenAPI openAPI() {
        String title = "Vasanta API 문서";
        String description = "Vasanta API에 대한 문서입니다.";
        Info info = new Info().title(title).description(description).version("1.0.0");
        return new OpenAPI().components(new Components()).info(info);
    }

    @Bean
    public GroupedOpenApi groupedOpenApi() {
        return GroupedOpenApi.builder()
                .group("vasanta")  // 그룹 이름 지정
                .packagesToScan("com.kepco.app")
                .build();
    }
}
