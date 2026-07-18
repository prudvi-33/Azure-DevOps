**1. The Core Scheduling Concepts You Must Know:** <br/>
  ✦ **nodeName:** The simplest, most direct bypass. It skips the scheduler completely and forces a pod onto a specific node by its exact name. <br/>
  ✦ **Labels and Selectors**: Key-value pairs attached to nodes that pods use to find them. <br/>
  ✦ **Node Affinity:** A powerful way to constrain pods to nodes based on labels. It has two strict modes: <br/>
   ㆍ requiredDuringSchedulingIgnoredDuringExecution: Hard rule (Pod must match, or it won't schedule). <br/>
   ㆍ preferredDuringSchedulingIgnoredDuringExecution: Soft rule (Try to match, but schedule elsewhere if no nodes fit). <br/>
  ✦ Taints and Tolerations: <br/>
   ㆍ Nodes are **tainted** to repel pods. <br/>
   ㆍ Pods must have **matching tolerations** to be allowed onto those tainted nodes. <br/>

**2. High-Speed Imperative Shortcuts:** <br/>
 You cannot create advanced scheduling rules completely via command flags. Use these commands to tag nodes and pull YAML templates fast: <br/>
 
 # Add a custom label to a specific worker node <br/>
kubectl label node node01 env=production <br/> <br/>

# Remove a label from a node (add a minus sign at the end) <br/>
kubectl label node node01 env- <br/> <br/>

# Taint a node so no normal pods can go there <br/>
kubectl taint node node01 dedicated=visuals:NoSchedule <br/> <br/>

# Remove a taint from a node (add a minus sign at the end)
kubectl taint node node01 dedicated=visuals:NoSchedule-
