package egovframework.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
        EgovConfigAspect.class,
        EgovConfigCommon.class,
        EgovConfigDatasource.class,
        EgovConfigMapper.class,
        EgovConfigProperties.class,
        EgovConfigTransaction.class,
        EgovConfigValidator.class
})
public class EgovConfig {

}
