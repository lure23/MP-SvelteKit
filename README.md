# Multipass-SvelteKit

Bootstrapping and developing a SvelteKit project, in a sandbox.

## Why?

When running the development in a sandbox, one no longer needs to trust `npm` or authors of the library modules. It reduces the attach footprint on development machines, and this author sees eventually all development would be done in a similar way.<sup>1</sup> The sandbox can be a cloud instance, or Docker. In this case, we use [MultiPass](https://multipass.run).

><sup>1)</sup> Sandboxing can be done using cloud instances, or virtualization frameworks. You can do the same in Docker.


## Focus of the repo

[SvelteKit](https://kit.svelte.dev) is a powerful development toolkit that can be used for creating web front ends, or full stack applications.

There are many ways you can use it - e.g. with or without Typescript. This repo does not want to takes sides on those choices. Instead, we provide the scaffolding *around* SvelteKit, Vite and `npm` to have you do *anything* with SvelteKit, but separated from your normal user account.


## Requirements

- Host OS

   >The code is developed on macOS, but the intention is that [any OS supported by the latest Multipass](https://multipass.run/docs/installing-on-linux) should be "good to go". If there are issues, please share a PR. :)

	>*On Windows 10/11, Pro or Enterprise license [would be recommended](https://multipass.run/docs/installing-on-windows#heading--hyper-v). The author only has Windows 10 Home + WSL2 and is not considering VirtualBox.*

- GNU `make`

	On Linux and macOS, this comes from the OS vendor.<sup>2</sup>
	
	><sup>2)</sup> May need command line tools to be installed on macOS; can anyone with a fresh macOS installation confirm?

	On Windows, please suggest a way.


- Multipass >= 1.12.0

	Go to GitHub > `multipass` > [`releases`](https://github.com/canonical/multipass/releases) and install the latest version from there.

	>Please note in the release notes, to run (on macOS):
	>
   >```
   >$ multipass set local.driver=qemu
   >```
   >
   >This only matters for 1.12.x.

<!-- Developed on:

macOS 13.4
multipass 1.12.0 (installed from a .dmg)
-->



## Steps

```
$ make first
```

Checks Multipass is installed, and downloads the Ubuntu image. Installs `npm` within the VM.

```
$ make install
```

Fetches 


## Using without Multipass

You would simply `cd work` and develop with your native tools. This way, there is no sandboxing.


## References

- [SvelteKit](https://kit.svelte.dev)
- [Multipass](https://multipass.run)



