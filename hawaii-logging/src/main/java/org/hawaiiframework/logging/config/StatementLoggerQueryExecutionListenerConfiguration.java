/*
 * Copyright 2015-2018 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.hawaiiframework.logging.config;

import net.ttddyy.dsproxy.listener.QueryExecutionListener;
import org.hawaiiframework.logging.sql.StatementLoggerQueryExecutionListener;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Configuration for statement execution logging.
 */
@ConditionalOnClass(QueryExecutionListener.class)
@Configuration
public class StatementLoggerQueryExecutionListenerConfiguration {
    /**
     * Create a statement logger query execution listener.
     *
     * @return The listener that logs JDBC statements.
     */
    @ConditionalOnClass(QueryExecutionListener.class)
    @Bean
    public StatementLoggerQueryExecutionListener statementLoggerQueryExecutionListener() {
        return new StatementLoggerQueryExecutionListener();
    }

}
