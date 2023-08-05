local utils = require('user.snippets.utils')

return {
    utils.snip(
        {
            trig = "pod",
            namr = "k8s Pod",
            dscr = "Kubernetes Pod definition",
        },
        utils.fmt(
            [[
                  apiVersion: v1
                  kind: Pod
                  metadata:
                    name: {}
                    labels:
                      {}: {}
                  spec:
                    containers:
                    - name: {}
                      image: {}:{}
                      ports:
                      - containerPort: {}
                ]],
            {
                utils.insert(1, "nginx"),
                utils.insert(2, "run"),
                utils.insert(3, "nginx"),
                utils.insert(4, "nginx"),
                utils.insert(5, "nginx"),
                utils.insert(6, "latest"),
                utils.insert(7, "80"),
            }
        )
    ),
    utils.snip(
        {
            trig = "deploy",
            namr = "k8s Deployment",
            dscr = "Kubernetes Deployment definition",
        },
        utils.fmt(
            [[
                  apiVersion: apps/v1
                  kind: Deployment
                  metadata:
                    name: {}
                    labels:
                      {}
                  spec:
                    replicas: {}
                    selector:
                      matchLabels:
                        {}
                    template:
                      metadata:
                        labels:
                          {}
                      spec:
                        containers:
                        - name: {}
                          image: {}:{}
                          ports:
                          - containerPort: {}
                ]],
            {
                utils.insert(1, "name"),
                utils.insert(2, "label"),
                utils.insert(3, "1"),
                utils.insert(4, "label"),
                utils.rep(4),
                utils.insert(5, "container_name"),
                utils.insert(6, "image"),
                utils.insert(7, "1.0"),
                utils.insert(8, "80"),
            }
        )
    ),
    utils.snip(
        {
            trig = "service",
            namr = "k8s Service",
            dscr = "Kubernetes Service definition",
        },
        utils.fmt(
            [[
                    apiVersion: v1
                    kind: Service
                    metadata:
                      name: {}
                      labels:
                        {}
                    spec:
                      selector:
                        {}
                      type: {}
                      ports:
                        {}
                ]],
            {
                utils.insert(1, "name"),
                utils.insert(2),
                utils.insert(3),
                utils.choice(4, {
                    utils.text "ClusterIP",
                    utils.text "NodePort",
                    utils.text "LoadBalancer",
                }),
                utils.dynamicn(5, utils.get_port_snip, { 4 }),
            }
        )
    ),
}
