; ModuleID = 'raytracing.c'
source_filename = "raytracing.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@light_orbit_radius = dso_local global float 4.000000e+00, align 4
@light_orbit_height = dso_local global float 2.000000e+00, align 4
@frames_per_rotation = dso_local global i32 60, align 4
@sphere_color_r = dso_local global i32 0, align 4
@sphere_color_g = dso_local global i32 240, align 4
@sphere_color_b = dso_local global i32 0, align 4
@sphere_alpha = dso_local global i32 255, align 4
@sphere_radius = dso_local global float 1.000000e+00, align 4
@sphere_x = dso_local global float 0.000000e+00, align 4
@sphere_y = dso_local global float 0.000000e+00, align 4
@sphere_z = dso_local global float 4.000000e+00, align 4
@camera_x = dso_local global float 0.000000e+00, align 4
@camera_y = dso_local global float 0.000000e+00, align 4
@camera_z = dso_local global float 0.000000e+00, align 4
@light_x = dso_local global float 0.000000e+00, align 4
@light_y = dso_local global float 0.000000e+00, align 4
@light_z = dso_local global float 0.000000e+00, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @norm_factor(float noundef %0, float noundef %1, float noundef %2) #0 {
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store float %0, ptr %4, align 4
  store float %1, ptr %5, align 4
  store float %2, ptr %6, align 4
  %7 = load float, ptr %4, align 4
  %8 = load float, ptr %4, align 4
  %9 = load float, ptr %5, align 4
  %10 = load float, ptr %5, align 4
  %11 = fmul float %9, %10
  %12 = call float @llvm.fmuladd.f32(float %7, float %8, float %11)
  %13 = load float, ptr %6, align 4
  %14 = load float, ptr %6, align 4
  %15 = call float @llvm.fmuladd.f32(float %13, float %14, float %12)
  %16 = call float @m_sqrt(float noundef %15)
  ret float %16
}

; Function Attrs: noinline nounwind optnone uwtable
define internal float @m_sqrt(float noundef %0) #0 {
  %2 = alloca float, align 4
  store float %0, ptr %2, align 4
  %3 = load float, ptr %2, align 4
  %4 = load float, ptr %2, align 4
  %5 = call float @rsqrt(float noundef %4)
  %6 = fmul float %3, %5
  ret float %6
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @trace(float noundef %0, float noundef %1, float noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  store float %0, ptr %5, align 4
  store float %1, ptr %6, align 4
  store float %2, ptr %7, align 4
  %12 = load float, ptr %5, align 4
  %13 = load float, ptr %6, align 4
  %14 = load float, ptr %7, align 4
  %15 = call float @intersect_sphere(float noundef %12, float noundef %13, float noundef %14)
  store float %15, ptr %8, align 4
  %16 = load float, ptr %8, align 4
  %17 = fcmp oge float %16, 0x46293E5940000000
  br i1 %17, label %18, label %19

18:                                               ; preds = %3
  store i32 -16777216, ptr %4, align 4
  br label %36

19:                                               ; preds = %3
  %20 = load float, ptr @camera_x, align 4
  %21 = load float, ptr %8, align 4
  %22 = load float, ptr %5, align 4
  %23 = call float @llvm.fmuladd.f32(float %21, float %22, float %20)
  store float %23, ptr %9, align 4
  %24 = load float, ptr @camera_y, align 4
  %25 = load float, ptr %8, align 4
  %26 = load float, ptr %6, align 4
  %27 = call float @llvm.fmuladd.f32(float %25, float %26, float %24)
  store float %27, ptr %10, align 4
  %28 = load float, ptr @camera_z, align 4
  %29 = load float, ptr %8, align 4
  %30 = load float, ptr %7, align 4
  %31 = call float @llvm.fmuladd.f32(float %29, float %30, float %28)
  store float %31, ptr %11, align 4
  %32 = load float, ptr %9, align 4
  %33 = load float, ptr %10, align 4
  %34 = load float, ptr %11, align 4
  %35 = call i32 @shade(float noundef %32, float noundef %33, float noundef %34)
  store i32 %35, ptr %4, align 4
  br label %36

36:                                               ; preds = %19, %18
  %37 = load i32, ptr %4, align 4
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define internal float @intersect_sphere(float noundef %0, float noundef %1, float noundef %2) #0 {
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca float, align 4
  store float %0, ptr %5, align 4
  store float %1, ptr %6, align 4
  store float %2, ptr %7, align 4
  %17 = load float, ptr @camera_x, align 4
  %18 = load float, ptr @sphere_x, align 4
  %19 = fsub float %17, %18
  store float %19, ptr %8, align 4
  %20 = load float, ptr @camera_y, align 4
  %21 = load float, ptr @sphere_y, align 4
  %22 = fsub float %20, %21
  store float %22, ptr %9, align 4
  %23 = load float, ptr @camera_z, align 4
  %24 = load float, ptr @sphere_z, align 4
  %25 = fsub float %23, %24
  store float %25, ptr %10, align 4
  %26 = load float, ptr %5, align 4
  %27 = load float, ptr %5, align 4
  %28 = load float, ptr %6, align 4
  %29 = load float, ptr %6, align 4
  %30 = fmul float %28, %29
  %31 = call float @llvm.fmuladd.f32(float %26, float %27, float %30)
  %32 = load float, ptr %7, align 4
  %33 = load float, ptr %7, align 4
  %34 = call float @llvm.fmuladd.f32(float %32, float %33, float %31)
  store float %34, ptr %11, align 4
  %35 = load float, ptr %8, align 4
  %36 = load float, ptr %5, align 4
  %37 = load float, ptr %9, align 4
  %38 = load float, ptr %6, align 4
  %39 = fmul float %37, %38
  %40 = call float @llvm.fmuladd.f32(float %35, float %36, float %39)
  %41 = load float, ptr %10, align 4
  %42 = load float, ptr %7, align 4
  %43 = call float @llvm.fmuladd.f32(float %41, float %42, float %40)
  %44 = fmul float 2.000000e+00, %43
  store float %44, ptr %12, align 4
  %45 = load float, ptr %8, align 4
  %46 = load float, ptr %8, align 4
  %47 = load float, ptr %9, align 4
  %48 = load float, ptr %9, align 4
  %49 = fmul float %47, %48
  %50 = call float @llvm.fmuladd.f32(float %45, float %46, float %49)
  %51 = load float, ptr %10, align 4
  %52 = load float, ptr %10, align 4
  %53 = call float @llvm.fmuladd.f32(float %51, float %52, float %50)
  %54 = load float, ptr @sphere_radius, align 4
  %55 = load float, ptr @sphere_radius, align 4
  %56 = fneg float %54
  %57 = call float @llvm.fmuladd.f32(float %56, float %55, float %53)
  store float %57, ptr %13, align 4
  %58 = load float, ptr %12, align 4
  %59 = load float, ptr %12, align 4
  %60 = load float, ptr %11, align 4
  %61 = fmul float 4.000000e+00, %60
  %62 = load float, ptr %13, align 4
  %63 = fmul float %61, %62
  %64 = fneg float %63
  %65 = call float @llvm.fmuladd.f32(float %58, float %59, float %64)
  store float %65, ptr %14, align 4
  %66 = load float, ptr %14, align 4
  %67 = fcmp olt float %66, 0.000000e+00
  br i1 %67, label %68, label %69

68:                                               ; preds = %3
  store float 0x46293E5940000000, ptr %4, align 4
  br label %96

69:                                               ; preds = %3
  %70 = load float, ptr %14, align 4
  %71 = call float @m_sqrt(float noundef %70)
  store float %71, ptr %15, align 4
  %72 = load float, ptr %12, align 4
  %73 = fneg float %72
  %74 = load float, ptr %15, align 4
  %75 = fsub float %73, %74
  %76 = load float, ptr %11, align 4
  %77 = fmul float 2.000000e+00, %76
  %78 = fdiv float %75, %77
  store float %78, ptr %16, align 4
  %79 = load float, ptr %16, align 4
  %80 = fcmp ogt float %79, 0x3EB0C6F7A0000000
  br i1 %80, label %81, label %83

81:                                               ; preds = %69
  %82 = load float, ptr %16, align 4
  store float %82, ptr %4, align 4
  br label %96

83:                                               ; preds = %69
  %84 = load float, ptr %12, align 4
  %85 = fneg float %84
  %86 = load float, ptr %15, align 4
  %87 = fadd float %85, %86
  %88 = load float, ptr %11, align 4
  %89 = fmul float 2.000000e+00, %88
  %90 = fdiv float %87, %89
  store float %90, ptr %16, align 4
  %91 = load float, ptr %16, align 4
  %92 = fcmp ogt float %91, 0x3EB0C6F7A0000000
  br i1 %92, label %93, label %95

93:                                               ; preds = %83
  %94 = load float, ptr %16, align 4
  store float %94, ptr %4, align 4
  br label %96

95:                                               ; preds = %83
  store float 0x46293E5940000000, ptr %4, align 4
  br label %96

96:                                               ; preds = %95, %93, %81, %68
  %97 = load float, ptr %4, align 4
  ret float %97
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @shade(float noundef %0, float noundef %1, float noundef %2) #0 {
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca i32, align 4
  store float %0, ptr %4, align 4
  store float %1, ptr %5, align 4
  store float %2, ptr %6, align 4
  %17 = load float, ptr %4, align 4
  %18 = load float, ptr @sphere_x, align 4
  %19 = fsub float %17, %18
  store float %19, ptr %7, align 4
  %20 = load float, ptr %5, align 4
  %21 = load float, ptr @sphere_y, align 4
  %22 = fsub float %20, %21
  store float %22, ptr %8, align 4
  %23 = load float, ptr %6, align 4
  %24 = load float, ptr @sphere_z, align 4
  %25 = fsub float %23, %24
  store float %25, ptr %9, align 4
  %26 = load float, ptr %7, align 4
  %27 = load float, ptr %8, align 4
  %28 = load float, ptr %9, align 4
  %29 = call float @norm_factor(float noundef %26, float noundef %27, float noundef %28)
  store float %29, ptr %10, align 4
  %30 = load float, ptr %10, align 4
  %31 = load float, ptr %7, align 4
  %32 = fdiv float %31, %30
  store float %32, ptr %7, align 4
  %33 = load float, ptr %10, align 4
  %34 = load float, ptr %8, align 4
  %35 = fdiv float %34, %33
  store float %35, ptr %8, align 4
  %36 = load float, ptr %10, align 4
  %37 = load float, ptr %9, align 4
  %38 = fdiv float %37, %36
  store float %38, ptr %9, align 4
  %39 = load float, ptr @light_x, align 4
  %40 = load float, ptr %4, align 4
  %41 = fsub float %39, %40
  store float %41, ptr %11, align 4
  %42 = load float, ptr @light_y, align 4
  %43 = load float, ptr %5, align 4
  %44 = fsub float %42, %43
  store float %44, ptr %12, align 4
  %45 = load float, ptr @light_z, align 4
  %46 = load float, ptr %6, align 4
  %47 = fsub float %45, %46
  store float %47, ptr %13, align 4
  %48 = load float, ptr %11, align 4
  %49 = load float, ptr %12, align 4
  %50 = load float, ptr %13, align 4
  %51 = call float @norm_factor(float noundef %48, float noundef %49, float noundef %50)
  store float %51, ptr %10, align 4
  %52 = load float, ptr %10, align 4
  %53 = load float, ptr %11, align 4
  %54 = fdiv float %53, %52
  store float %54, ptr %11, align 4
  %55 = load float, ptr %10, align 4
  %56 = load float, ptr %12, align 4
  %57 = fdiv float %56, %55
  store float %57, ptr %12, align 4
  %58 = load float, ptr %10, align 4
  %59 = load float, ptr %13, align 4
  %60 = fdiv float %59, %58
  store float %60, ptr %13, align 4
  %61 = load float, ptr %7, align 4
  %62 = load float, ptr %11, align 4
  %63 = load float, ptr %8, align 4
  %64 = load float, ptr %12, align 4
  %65 = fmul float %63, %64
  %66 = call float @llvm.fmuladd.f32(float %61, float %62, float %65)
  %67 = load float, ptr %9, align 4
  %68 = load float, ptr %13, align 4
  %69 = call float @llvm.fmuladd.f32(float %67, float %68, float %66)
  store float %69, ptr %14, align 4
  %70 = load float, ptr %14, align 4
  %71 = fcmp olt float %70, 0.000000e+00
  br i1 %71, label %72, label %73

72:                                               ; preds = %3
  store float 0.000000e+00, ptr %14, align 4
  br label %73

73:                                               ; preds = %72, %3
  %74 = load float, ptr %14, align 4
  %75 = call float @llvm.fmuladd.f32(float 0x3FECCCCCC0000000, float %74, float 0x3FB99999A0000000)
  store float %75, ptr %15, align 4
  %76 = load i32, ptr @sphere_alpha, align 4
  %77 = shl i32 %76, 24
  store i32 %77, ptr %16, align 4
  %78 = load i32, ptr @sphere_color_r, align 4
  %79 = sitofp i32 %78 to float
  %80 = load float, ptr %15, align 4
  %81 = fmul float %79, %80
  %82 = fptoui float %81 to i32
  %83 = shl i32 %82, 16
  %84 = load i32, ptr %16, align 4
  %85 = or i32 %84, %83
  store i32 %85, ptr %16, align 4
  %86 = load i32, ptr @sphere_color_g, align 4
  %87 = sitofp i32 %86 to float
  %88 = load float, ptr %15, align 4
  %89 = fmul float %87, %88
  %90 = fptoui float %89 to i32
  %91 = shl i32 %90, 8
  %92 = load i32, ptr %16, align 4
  %93 = or i32 %92, %91
  store i32 %93, ptr %16, align 4
  %94 = load i32, ptr @sphere_color_b, align 4
  %95 = sitofp i32 %94 to float
  %96 = load float, ptr %15, align 4
  %97 = fmul float %95, %96
  %98 = fptoui float %97 to i32
  %99 = load i32, ptr %16, align 4
  %100 = or i32 %99, %98
  store i32 %100, ptr %16, align 4
  %101 = load i32, ptr %16, align 4
  ret i32 %101
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @render() #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %9 = alloca i32, align 4
  store i32 0, ptr %4, align 4
  br label %10

10:                                               ; preds = %56, %0
  %11 = load i32, ptr %4, align 4
  %12 = icmp slt i32 %11, 768
  br i1 %12, label %13, label %59

13:                                               ; preds = %10
  store i32 0, ptr %5, align 4
  br label %14

14:                                               ; preds = %52, %13
  %15 = load i32, ptr %5, align 4
  %16 = icmp slt i32 %15, 1536
  br i1 %16, label %17, label %55

17:                                               ; preds = %14
  store float 1.000000e+00, ptr %3, align 4
  %18 = load i32, ptr %5, align 4
  %19 = sitofp i32 %18 to float
  %20 = fadd float %19, 5.000000e-01
  %21 = fdiv float %20, 1.536000e+03
  store float %21, ptr %6, align 4
  %22 = load i32, ptr %4, align 4
  %23 = sitofp i32 %22 to float
  %24 = fadd float %23, 5.000000e-01
  %25 = fdiv float %24, 7.680000e+02
  store float %25, ptr %7, align 4
  %26 = load float, ptr %6, align 4
  %27 = fsub float %26, 5.000000e-01
  %28 = fmul float %27, 2.000000e+00
  store float %28, ptr %1, align 4
  %29 = load float, ptr %7, align 4
  %30 = fsub float 5.000000e-01, %29
  %31 = fmul float %30, 1.000000e+00
  store float %31, ptr %2, align 4
  %32 = load float, ptr %1, align 4
  %33 = load float, ptr %2, align 4
  %34 = load float, ptr %3, align 4
  %35 = call float @norm_factor(float noundef %32, float noundef %33, float noundef %34)
  store float %35, ptr %8, align 4
  %36 = load float, ptr %8, align 4
  %37 = load float, ptr %1, align 4
  %38 = fdiv float %37, %36
  store float %38, ptr %1, align 4
  %39 = load float, ptr %8, align 4
  %40 = load float, ptr %2, align 4
  %41 = fdiv float %40, %39
  store float %41, ptr %2, align 4
  %42 = load float, ptr %8, align 4
  %43 = load float, ptr %3, align 4
  %44 = fdiv float %43, %42
  store float %44, ptr %3, align 4
  %45 = load float, ptr %1, align 4
  %46 = load float, ptr %2, align 4
  %47 = load float, ptr %3, align 4
  %48 = call i32 @trace(float noundef %45, float noundef %46, float noundef %47)
  store i32 %48, ptr %9, align 4
  %49 = load i32, ptr %5, align 4
  %50 = load i32, ptr %4, align 4
  %51 = load i32, ptr %9, align 4
  call void @simPutPixel(i32 noundef %49, i32 noundef %50, i32 noundef %51)
  br label %52

52:                                               ; preds = %17
  %53 = load i32, ptr %5, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %5, align 4
  br label %14, !llvm.loop !6

55:                                               ; preds = %14
  br label %56

56:                                               ; preds = %55
  %57 = load i32, ptr %4, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %4, align 4
  br label %10, !llvm.loop !8

59:                                               ; preds = %10
  ret void
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @app() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  store i32 0, ptr %1, align 4
  br label %4

4:                                                ; preds = %56, %0
  %5 = load i32, ptr %1, align 4
  %6 = icmp slt i32 %5, 100
  br i1 %6, label %7, label %59

7:                                                ; preds = %4
  store i32 0, ptr %2, align 4
  br label %8

8:                                                ; preds = %42, %7
  %9 = load i32, ptr %2, align 4
  %10 = load i32, ptr @frames_per_rotation, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %45

12:                                               ; preds = %8
  %13 = load i32, ptr %2, align 4
  %14 = sitofp i32 %13 to float
  %15 = fmul float 0x401921FB60000000, %14
  %16 = load i32, ptr @frames_per_rotation, align 4
  %17 = sitofp i32 %16 to float
  %18 = fdiv float %15, %17
  store float %18, ptr %3, align 4
  %19 = load float, ptr @sphere_x, align 4
  %20 = load float, ptr @light_orbit_radius, align 4
  %21 = load float, ptr %3, align 4
  %22 = call float @m_cos(float noundef %21)
  %23 = call float @llvm.fmuladd.f32(float %20, float %22, float %19)
  store float %23, ptr @light_x, align 4
  %24 = load float, ptr @sphere_y, align 4
  %25 = load float, ptr @light_orbit_height, align 4
  %26 = fadd float %24, %25
  store float %26, ptr @light_y, align 4
  %27 = load float, ptr @sphere_z, align 4
  %28 = load float, ptr @light_orbit_radius, align 4
  %29 = load float, ptr %3, align 4
  %30 = call float @m_sin(float noundef %29)
  %31 = call float @llvm.fmuladd.f32(float %28, float %30, float %27)
  store float %31, ptr @light_z, align 4
  call void @render()
  call void (...) @simFlush()
  %32 = load i32, ptr @sphere_color_b, align 4
  %33 = add nsw i32 %32, 3
  store i32 %33, ptr @sphere_color_b, align 4
  %34 = load i32, ptr @sphere_color_b, align 4
  %35 = srem i32 %34, 255
  store i32 %35, ptr @sphere_color_b, align 4
  %36 = load i32, ptr %1, align 4
  %37 = sitofp i32 %36 to float
  %38 = load float, ptr %3, align 4
  %39 = fmul float %37, %38
  %40 = call float @m_sin(float noundef %39)
  %41 = fadd float 4.000000e+00, %40
  store float %41, ptr @light_orbit_radius, align 4
  br label %42

42:                                               ; preds = %12
  %43 = load i32, ptr %2, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %2, align 4
  br label %8, !llvm.loop !9

45:                                               ; preds = %8
  %46 = load i32, ptr %1, align 4
  %47 = srem i32 %46, 2
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %52

49:                                               ; preds = %45
  %50 = load i32, ptr @frames_per_rotation, align 4
  %51 = sdiv i32 %50, 2
  store i32 %51, ptr @frames_per_rotation, align 4
  br label %55

52:                                               ; preds = %45
  %53 = load i32, ptr @frames_per_rotation, align 4
  %54 = mul nsw i32 %53, 2
  store i32 %54, ptr @frames_per_rotation, align 4
  br label %55

55:                                               ; preds = %52, %49
  br label %56

56:                                               ; preds = %55
  %57 = load i32, ptr %1, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %1, align 4
  br label %4, !llvm.loop !10

59:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal float @m_cos(float noundef %0) #0 {
  %2 = alloca float, align 4
  store float %0, ptr %2, align 4
  %3 = load float, ptr %2, align 4
  %4 = call float @cos_taylor(float noundef %3)
  ret float %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal float @m_sin(float noundef %0) #0 {
  %2 = alloca float, align 4
  store float %0, ptr %2, align 4
  %3 = load float, ptr %2, align 4
  %4 = fsub float %3, 0x3FF921FB60000000
  %5 = call float @m_cos(float noundef %4)
  ret float %5
}

declare void @simFlush(...) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal float @rsqrt(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  store float %0, ptr %3, align 4
  %6 = load float, ptr %3, align 4
  %7 = fcmp olt float %6, 0.000000e+00
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  store float 0x7FF8000000000000, ptr %2, align 4
  br label %36

9:                                                ; preds = %1
  %10 = load float, ptr %3, align 4
  %11 = call i32 @bits(float noundef %10)
  store i32 %11, ptr %4, align 4
  %12 = load i32, ptr %4, align 4
  %13 = ashr i32 %12, 1
  %14 = sub nsw i32 1597463007, %13
  store i32 %14, ptr %4, align 4
  %15 = load i32, ptr %4, align 4
  %16 = call float @from_bits(i32 noundef %15)
  store float %16, ptr %5, align 4
  %17 = load float, ptr %5, align 4
  %18 = load float, ptr %3, align 4
  %19 = fmul float 5.000000e-01, %18
  %20 = load float, ptr %5, align 4
  %21 = fmul float %19, %20
  %22 = load float, ptr %5, align 4
  %23 = fneg float %21
  %24 = call float @llvm.fmuladd.f32(float %23, float %22, float 1.500000e+00)
  %25 = fmul float %17, %24
  store float %25, ptr %5, align 4
  %26 = load float, ptr %5, align 4
  %27 = load float, ptr %3, align 4
  %28 = fmul float 5.000000e-01, %27
  %29 = load float, ptr %5, align 4
  %30 = fmul float %28, %29
  %31 = load float, ptr %5, align 4
  %32 = fneg float %30
  %33 = call float @llvm.fmuladd.f32(float %32, float %31, float 1.500000e+00)
  %34 = fmul float %26, %33
  store float %34, ptr %5, align 4
  %35 = load float, ptr %5, align 4
  store float %35, ptr %2, align 4
  br label %36

36:                                               ; preds = %9, %8
  %37 = load float, ptr %2, align 4
  ret float %37
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @bits(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  store float %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 %2, i64 4, i1 false)
  %4 = load i32, ptr %3, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define internal float @from_bits(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca float, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 %2, i64 4, i1 false)
  %4 = load float, ptr %3, align 4
  ret float %4
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal float @cos_taylor(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca i32, align 4
  store float %0, ptr %2, align 4
  %9 = load float, ptr %2, align 4
  %10 = fadd float %9, 0x400921FB60000000
  %11 = call float @float_mod(float noundef %10, float noundef 0x401921FB60000000)
  %12 = fsub float %11, 0x400921FB60000000
  store float %12, ptr %3, align 4
  %13 = load float, ptr %3, align 4
  %14 = call float @m_abs(float noundef %13)
  store float %14, ptr %3, align 4
  store float 1.000000e+00, ptr %4, align 4
  %15 = load float, ptr %3, align 4
  %16 = fcmp ogt float %15, 0x3FF921FB60000000
  br i1 %16, label %17, label %20

17:                                               ; preds = %1
  %18 = load float, ptr %3, align 4
  %19 = fsub float 0x400921FB60000000, %18
  store float %19, ptr %3, align 4
  store float -1.000000e+00, ptr %4, align 4
  br label %20

20:                                               ; preds = %17, %1
  %21 = load float, ptr %3, align 4
  %22 = load float, ptr %3, align 4
  %23 = fmul float %21, %22
  store float %23, ptr %5, align 4
  store float 1.000000e+00, ptr %6, align 4
  store float 1.000000e+00, ptr %7, align 4
  store i32 1, ptr %8, align 4
  br label %24

24:                                               ; preds = %43, %20
  %25 = load i32, ptr %8, align 4
  %26 = icmp slt i32 %25, 6
  br i1 %26, label %27, label %46

27:                                               ; preds = %24
  %28 = load float, ptr %5, align 4
  %29 = fneg float %28
  %30 = load i32, ptr %8, align 4
  %31 = mul nsw i32 2, %30
  %32 = sub nsw i32 %31, 1
  %33 = load i32, ptr %8, align 4
  %34 = mul nsw i32 2, %33
  %35 = mul nsw i32 %32, %34
  %36 = sitofp i32 %35 to float
  %37 = fdiv float %29, %36
  %38 = load float, ptr %6, align 4
  %39 = fmul float %38, %37
  store float %39, ptr %6, align 4
  %40 = load float, ptr %6, align 4
  %41 = load float, ptr %7, align 4
  %42 = fadd float %41, %40
  store float %42, ptr %7, align 4
  br label %43

43:                                               ; preds = %27
  %44 = load i32, ptr %8, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %8, align 4
  br label %24, !llvm.loop !11

46:                                               ; preds = %24
  %47 = load float, ptr %4, align 4
  %48 = load float, ptr %7, align 4
  %49 = fmul float %47, %48
  ret float %49
}

; Function Attrs: noinline nounwind optnone uwtable
define internal float @float_mod(float noundef %0, float noundef %1) #0 {
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %9 = alloca float, align 4
  store float %0, ptr %4, align 4
  store float %1, ptr %5, align 4
  %10 = load float, ptr %4, align 4
  %11 = call i32 @is_nan(float noundef %10)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %17, label %13

13:                                               ; preds = %2
  %14 = load float, ptr %5, align 4
  %15 = call i32 @is_nan(float noundef %14)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %13, %2
  store float 0x7FF8000000000000, ptr %3, align 4
  br label %67

18:                                               ; preds = %13
  %19 = load float, ptr %5, align 4
  %20 = call i32 @is_zero(float noundef %19)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %18
  store float 0x7FF8000000000000, ptr %3, align 4
  br label %67

23:                                               ; preds = %18
  %24 = load float, ptr %4, align 4
  %25 = call i32 @is_zero(float noundef %24)
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %23
  store float 0.000000e+00, ptr %3, align 4
  br label %67

28:                                               ; preds = %23
  %29 = load float, ptr %4, align 4
  %30 = call float @m_abs(float noundef %29)
  store float %30, ptr %6, align 4
  %31 = load float, ptr %5, align 4
  %32 = call float @m_abs(float noundef %31)
  store float %32, ptr %7, align 4
  %33 = load float, ptr %6, align 4
  %34 = load float, ptr %7, align 4
  %35 = fdiv float %33, %34
  %36 = call float @floor_impl(float noundef %35)
  store float %36, ptr %8, align 4
  %37 = load float, ptr %6, align 4
  %38 = load float, ptr %8, align 4
  %39 = load float, ptr %7, align 4
  %40 = fneg float %38
  %41 = call float @llvm.fmuladd.f32(float %40, float %39, float %37)
  store float %41, ptr %9, align 4
  %42 = load float, ptr %9, align 4
  %43 = fcmp olt float %42, 0.000000e+00
  br i1 %43, label %44, label %48

44:                                               ; preds = %28
  %45 = load float, ptr %7, align 4
  %46 = load float, ptr %9, align 4
  %47 = fadd float %46, %45
  store float %47, ptr %9, align 4
  br label %48

48:                                               ; preds = %44, %28
  %49 = load float, ptr %9, align 4
  %50 = load float, ptr %7, align 4
  %51 = fcmp oge float %49, %50
  br i1 %51, label %52, label %56

52:                                               ; preds = %48
  %53 = load float, ptr %7, align 4
  %54 = load float, ptr %9, align 4
  %55 = fsub float %54, %53
  store float %55, ptr %9, align 4
  br label %56

56:                                               ; preds = %52, %48
  %57 = load float, ptr %4, align 4
  %58 = call i32 @sign_bit(float noundef %57)
  %59 = icmp eq i32 %58, 1
  br i1 %59, label %60, label %63

60:                                               ; preds = %56
  %61 = load float, ptr %9, align 4
  %62 = fneg float %61
  br label %65

63:                                               ; preds = %56
  %64 = load float, ptr %9, align 4
  br label %65

65:                                               ; preds = %63, %60
  %66 = phi float [ %62, %60 ], [ %64, %63 ]
  store float %66, ptr %3, align 4
  br label %67

67:                                               ; preds = %65, %27, %22, %17
  %68 = load float, ptr %3, align 4
  ret float %68
}

; Function Attrs: noinline nounwind optnone uwtable
define internal float @m_abs(float noundef %0) #0 {
  %2 = alloca float, align 4
  store float %0, ptr %2, align 4
  %3 = load float, ptr %2, align 4
  %4 = call i32 @abs_bits(float noundef %3)
  %5 = call float @from_bits(i32 noundef %4)
  ret float %5
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @is_nan(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store float %0, ptr %2, align 4
  %5 = load float, ptr %2, align 4
  %6 = call i32 @bits(float noundef %5)
  %7 = ashr i32 %6, 23
  %8 = and i32 %7, 255
  store i32 %8, ptr %3, align 4
  %9 = load float, ptr %2, align 4
  %10 = call i32 @bits(float noundef %9)
  %11 = and i32 %10, 8388607
  store i32 %11, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = icmp eq i32 %12, 255
  br i1 %13, label %14, label %17

14:                                               ; preds = %1
  %15 = load i32, ptr %4, align 4
  %16 = icmp ne i32 %15, 0
  br label %17

17:                                               ; preds = %14, %1
  %18 = phi i1 [ false, %1 ], [ %16, %14 ]
  %19 = zext i1 %18 to i32
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @is_zero(float noundef %0) #0 {
  %2 = alloca float, align 4
  store float %0, ptr %2, align 4
  %3 = load float, ptr %2, align 4
  %4 = call i32 @abs_bits(float noundef %3)
  %5 = icmp eq i32 %4, 0
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone uwtable
define internal float @floor_impl(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store float %0, ptr %3, align 4
  %8 = load float, ptr %3, align 4
  %9 = call i32 @is_nan(float noundef %8)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %1
  %12 = load float, ptr %3, align 4
  store float %12, ptr %2, align 4
  br label %64

13:                                               ; preds = %1
  %14 = load float, ptr %3, align 4
  %15 = call float @m_abs(float noundef %14)
  %16 = fcmp oge float %15, 0x4160000000000000
  br i1 %16, label %17, label %19

17:                                               ; preds = %13
  %18 = load float, ptr %3, align 4
  store float %18, ptr %2, align 4
  br label %64

19:                                               ; preds = %13
  %20 = load float, ptr %3, align 4
  %21 = call float @m_abs(float noundef %20)
  %22 = fcmp olt float %21, 1.000000e+00
  br i1 %22, label %23, label %29

23:                                               ; preds = %19
  %24 = load float, ptr %3, align 4
  %25 = call i32 @sign_bit(float noundef %24)
  %26 = icmp eq i32 %25, 0
  %27 = zext i1 %26 to i64
  %28 = select i1 %26, float 0.000000e+00, float -1.000000e+00
  store float %28, ptr %2, align 4
  br label %64

29:                                               ; preds = %19
  %30 = load float, ptr %3, align 4
  %31 = call i32 @bits(float noundef %30)
  store i32 %31, ptr %4, align 4
  %32 = load i32, ptr %4, align 4
  %33 = ashr i32 %32, 23
  %34 = and i32 %33, 255
  %35 = sub nsw i32 %34, 127
  store i32 %35, ptr %5, align 4
  %36 = load i32, ptr %5, align 4
  %37 = sub nsw i32 23, %36
  store i32 %37, ptr %6, align 4
  %38 = load i32, ptr %6, align 4
  %39 = shl i32 1, %38
  %40 = sub nsw i32 %39, 1
  store i32 %40, ptr %7, align 4
  %41 = load i32, ptr %4, align 4
  %42 = load i32, ptr %7, align 4
  %43 = and i32 %41, %42
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %47

45:                                               ; preds = %29
  %46 = load float, ptr %3, align 4
  store float %46, ptr %2, align 4
  br label %64

47:                                               ; preds = %29
  %48 = load float, ptr %3, align 4
  %49 = call i32 @sign_bit(float noundef %48)
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %57

51:                                               ; preds = %47
  %52 = load i32, ptr %4, align 4
  %53 = load i32, ptr %7, align 4
  %54 = xor i32 %53, -1
  %55 = and i32 %52, %54
  %56 = call float @from_bits(i32 noundef %55)
  store float %56, ptr %2, align 4
  br label %64

57:                                               ; preds = %47
  %58 = load i32, ptr %4, align 4
  %59 = load i32, ptr %7, align 4
  %60 = xor i32 %59, -1
  %61 = and i32 %58, %60
  %62 = call float @from_bits(i32 noundef %61)
  %63 = fsub float %62, 1.000000e+00
  store float %63, ptr %2, align 4
  br label %64

64:                                               ; preds = %57, %51, %45, %23, %17, %11
  %65 = load float, ptr %2, align 4
  ret float %65
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @sign_bit(float noundef %0) #0 {
  %2 = alloca float, align 4
  store float %0, ptr %2, align 4
  %3 = load float, ptr %2, align 4
  %4 = call i32 @bits(float noundef %3)
  %5 = ashr i32 %4, 31
  %6 = and i32 %5, 1
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @abs_bits(float noundef %0) #0 {
  %2 = alloca float, align 4
  store float %0, ptr %2, align 4
  %3 = load float, ptr %2, align 4
  %4 = call i32 @bits(float noundef %3)
  %5 = and i32 %4, 2147483647
  ret i32 %5
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
