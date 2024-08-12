const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const foo = b.dependency("foo", .{
        .target = target,
        .optimize = optimize,
    });

    const files = foo.namedWriteFiles("files");

    const mod = b.addModule("boo", .{
        .target = target,
        .optimize = optimize,
    });
    mod.addIncludePath(files.getDirectory());

    const exe = b.addExecutable(.{
        .name = "bar",
        .root_source_file = b.path("bar.zig"),
        .target = target,
        .optimize = optimize,
    });
    exe.root_module.addImport("mod", mod);
    b.installArtifact(exe);
}
