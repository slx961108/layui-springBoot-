package com.cls.monitor.endpoint;

import com.cls.common.annotation.MyEndPoint;
import org.springframework.boot.actuate.trace.http.HttpTrace;
import org.springframework.boot.actuate.trace.http.HttpTraceRepository;

import java.util.List;

/**
 * @author WeiMaomao
 */
@MyEndPoint
public class MyHttpTraceEndpoint {

    private final HttpTraceRepository repository;

    public MyHttpTraceEndpoint(HttpTraceRepository repository) {
        this.repository = repository;
    }

    public MyHttpTraceDescriptor traces() {
        return new MyHttpTraceDescriptor(this.repository.findAll());
    }

    public static final class MyHttpTraceDescriptor {

        private final List<HttpTrace> traces;

        private MyHttpTraceDescriptor(List<HttpTrace> traces) {
            this.traces = traces;
        }

        public List<HttpTrace> getTraces() {
            return this.traces;
        }
    }
}
