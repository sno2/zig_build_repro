const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.standardTargetOptions(.{});
    _ = b.standardOptimizeOption(.{});

    const touch_cmd = b.addSystemCommand(&.{ "touch", "foo.txt" });

    const files = b.addNamedWriteFiles("files");
    files.step.dependOn(&touch_cmd.step);
    _ = files.addCopyFile(b.path("foo.txt"), "foo.txt");
}
