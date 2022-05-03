# LInux process magic with /proc

## /proc  -: Important points 

<ol>
  <li> Virtual file created on Boot and disolve at reboot!! </li>
  <li> alos known as control and information center of kernel </li>
 
</ol>

## every process in linux creates a PId which got stored in /proc 

### Example 

```
vim  /tmp/a.txt -- > is creating a process 
```

### check process id by using any command you know 

```
pidof vim
1554101

```

### now lets go to this PId location 

```
 cd /proc/1554101
root@node155:/proc/1554101# ls
arch_status         cwd        mem            patch_state   stat
attr                environ    mountinfo      personality   statm
autogroup           exe        mounts         projid_map    status
auxv                fd         mountstats     root          syscall
cgroup              fdinfo     net            sched         task
clear_refs          gid_map    ns             schedstat     timens_offsets
cmdline             io         numa_maps      sessionid     timers
comm                limits     oom_adj        setgroups     timerslack_ns
coredump_filter     loginuid   oom_score      smaps         uid_map
cpu_resctrl_groups  map_files  oom_score_adj  smaps_rollup  wchan
cpuset              maps       pagemap        stack

```

## lets explore some important directory 

###  /proc/PID/cmdline 

<p>Here name related  info like command name of entire path  </p>

```
cat cmdline 
vim/tmp/test.txt
```



