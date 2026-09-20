; ModuleID = 'raytracing.c'
source_filename = "raytracing.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@BACKGROUND = dso_local local_unnamed_addr constant i32 -16777216, align 4
@AMBIENT = dso_local local_unnamed_addr constant float 0x3FB99999A0000000, align 4
@light_orbit_radius = dso_local local_unnamed_addr global float 4.000000e+00, align 4
@light_orbit_height = dso_local local_unnamed_addr global float 2.000000e+00, align 4
@frames_per_rotation = dso_local local_unnamed_addr global i32 60, align 4
@ROTATIONS = dso_local local_unnamed_addr constant i32 100, align 4
@WINDOW_WIDTH = dso_local local_unnamed_addr constant float 2.000000e+00, align 4
@WINDOW_HEIGHT = dso_local local_unnamed_addr constant float 1.000000e+00, align 4
@WINDOW_DISTANCE = dso_local local_unnamed_addr constant float 1.000000e+00, align 4
@sphere_color_r = dso_local local_unnamed_addr global i32 0, align 4
@sphere_color_g = dso_local local_unnamed_addr global i32 240, align 4
@sphere_color_b = dso_local local_unnamed_addr global i32 0, align 4
@sphere_alpha = dso_local local_unnamed_addr global i32 255, align 4
@sphere_radius = dso_local local_unnamed_addr global float 1.000000e+00, align 4
@sphere_x = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@sphere_y = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@sphere_z = dso_local local_unnamed_addr global float 4.000000e+00, align 4
@camera_x = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@camera_y = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@camera_z = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@light_x = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@light_y = dso_local local_unnamed_addr global float 0.000000e+00, align 4
@light_z = dso_local local_unnamed_addr global float 0.000000e+00, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local float @norm_factor(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #0 {
  %4 = fmul float %1, %1
  %5 = tail call float @llvm.fmuladd.f32(float %0, float %0, float %4)
  %6 = tail call float @llvm.fmuladd.f32(float %2, float %2, float %5)
  %7 = bitcast float %6 to i32
  %8 = ashr i32 %7, 1
  %9 = sub nsw i32 1597463007, %8
  %10 = bitcast i32 %9 to float
  %11 = fmul float %6, -5.000000e-01
  %12 = fmul float %11, %10
  %13 = tail call float @llvm.fmuladd.f32(float %12, float %10, float 1.500000e+00)
  %14 = fmul float %13, %10
  %15 = fmul float %11, %14
  %16 = tail call float @llvm.fmuladd.f32(float %15, float %14, float 1.500000e+00)
  %17 = fmul float %14, %16
  %18 = fmul float %6, %17
  ret float %18
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none) uwtable
define dso_local i32 @shade(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #2 {
  %4 = load float, ptr @sphere_x, align 4, !tbaa !5
  %5 = load float, ptr @sphere_y, align 4, !tbaa !5
  %6 = load float, ptr @sphere_z, align 4, !tbaa !5
  %7 = load float, ptr @light_x, align 4, !tbaa !5
  %8 = load float, ptr @light_y, align 4, !tbaa !5
  %9 = load float, ptr @light_z, align 4, !tbaa !5
  %10 = insertelement <2 x float> poison, float %0, i64 0
  %11 = insertelement <2 x float> %10, float %7, i64 1
  %12 = insertelement <2 x float> poison, float %4, i64 0
  %13 = insertelement <2 x float> %12, float %0, i64 1
  %14 = fsub <2 x float> %11, %13
  %15 = insertelement <2 x float> poison, float %1, i64 0
  %16 = insertelement <2 x float> %15, float %8, i64 1
  %17 = insertelement <2 x float> poison, float %5, i64 0
  %18 = insertelement <2 x float> %17, float %1, i64 1
  %19 = fsub <2 x float> %16, %18
  %20 = insertelement <2 x float> poison, float %2, i64 0
  %21 = insertelement <2 x float> %20, float %9, i64 1
  %22 = insertelement <2 x float> poison, float %6, i64 0
  %23 = insertelement <2 x float> %22, float %2, i64 1
  %24 = fsub <2 x float> %21, %23
  %25 = fmul <2 x float> %19, %19
  %26 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %14, <2 x float> %14, <2 x float> %25)
  %27 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %24, <2 x float> %24, <2 x float> %26)
  %28 = bitcast <2 x float> %27 to <2 x i32>
  %29 = ashr <2 x i32> %28, <i32 1, i32 1>
  %30 = sub nsw <2 x i32> <i32 1597463007, i32 1597463007>, %29
  %31 = bitcast <2 x i32> %30 to <2 x float>
  %32 = fmul <2 x float> %27, <float -5.000000e-01, float -5.000000e-01>
  %33 = fmul <2 x float> %32, %31
  %34 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %33, <2 x float> %31, <2 x float> <float 1.500000e+00, float 1.500000e+00>)
  %35 = fmul <2 x float> %34, %31
  %36 = fmul <2 x float> %32, %35
  %37 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %36, <2 x float> %35, <2 x float> <float 1.500000e+00, float 1.500000e+00>)
  %38 = fmul <2 x float> %35, %37
  %39 = fmul <2 x float> %27, %38
  %40 = extractelement <2 x float> %39, i64 0
  %41 = extractelement <2 x float> %14, i64 0
  %42 = fdiv float %41, %40
  %43 = extractelement <2 x float> %24, i64 0
  %44 = fdiv float %43, %40
  %45 = extractelement <2 x float> %39, i64 1
  %46 = extractelement <2 x float> %14, i64 1
  %47 = fdiv float %46, %45
  %48 = fdiv <2 x float> %19, %39
  %49 = extractelement <2 x float> %24, i64 1
  %50 = fdiv float %49, %45
  %51 = shufflevector <2 x float> %48, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %52 = fmul <2 x float> %48, %51
  %53 = extractelement <2 x float> %52, i64 0
  %54 = tail call float @llvm.fmuladd.f32(float %42, float %47, float %53)
  %55 = tail call float @llvm.fmuladd.f32(float %44, float %50, float %54)
  %56 = fcmp olt float %55, 0.000000e+00
  %57 = select i1 %56, float 0.000000e+00, float %55
  %58 = tail call float @llvm.fmuladd.f32(float %57, float 0x3FECCCCCC0000000, float 0x3FB99999A0000000)
  %59 = load i32, ptr @sphere_alpha, align 4, !tbaa !9
  %60 = shl i32 %59, 24
  %61 = load i32, ptr @sphere_color_r, align 4, !tbaa !9
  %62 = sitofp i32 %61 to float
  %63 = fmul float %58, %62
  %64 = fptoui float %63 to i32
  %65 = shl i32 %64, 16
  %66 = load i32, ptr @sphere_color_g, align 4, !tbaa !9
  %67 = sitofp i32 %66 to float
  %68 = fmul float %58, %67
  %69 = fptoui float %68 to i32
  %70 = shl i32 %69, 8
  %71 = load i32, ptr @sphere_color_b, align 4, !tbaa !9
  %72 = sitofp i32 %71 to float
  %73 = fmul float %58, %72
  %74 = fptoui float %73 to i32
  %75 = or i32 %60, %74
  %76 = or i32 %75, %65
  %77 = or i32 %76, %70
  ret i32 %77
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none) uwtable
define dso_local float @intersect_sphere(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #2 {
  %4 = load float, ptr @camera_x, align 4, !tbaa !5
  %5 = load float, ptr @sphere_x, align 4, !tbaa !5
  %6 = fsub float %4, %5
  %7 = load float, ptr @camera_y, align 4, !tbaa !5
  %8 = load float, ptr @sphere_y, align 4, !tbaa !5
  %9 = fsub float %7, %8
  %10 = load float, ptr @camera_z, align 4, !tbaa !5
  %11 = load float, ptr @sphere_z, align 4, !tbaa !5
  %12 = fsub float %10, %11
  %13 = fmul float %1, %1
  %14 = tail call float @llvm.fmuladd.f32(float %0, float %0, float %13)
  %15 = tail call float @llvm.fmuladd.f32(float %2, float %2, float %14)
  %16 = fmul float %9, %1
  %17 = tail call float @llvm.fmuladd.f32(float %6, float %0, float %16)
  %18 = tail call float @llvm.fmuladd.f32(float %12, float %2, float %17)
  %19 = fmul float %18, 2.000000e+00
  %20 = fmul float %9, %9
  %21 = tail call float @llvm.fmuladd.f32(float %6, float %6, float %20)
  %22 = tail call float @llvm.fmuladd.f32(float %12, float %12, float %21)
  %23 = load float, ptr @sphere_radius, align 4, !tbaa !5
  %24 = fneg float %23
  %25 = tail call float @llvm.fmuladd.f32(float %24, float %23, float %22)
  %26 = fmul float %15, -4.000000e+00
  %27 = fmul float %26, %25
  %28 = tail call float @llvm.fmuladd.f32(float %19, float %19, float %27)
  %29 = fcmp olt float %28, 0.000000e+00
  br i1 %29, label %53, label %30

30:                                               ; preds = %3
  %31 = bitcast float %28 to i32
  %32 = ashr i32 %31, 1
  %33 = sub nsw i32 1597463007, %32
  %34 = bitcast i32 %33 to float
  %35 = fmul float %28, -5.000000e-01
  %36 = fmul float %35, %34
  %37 = tail call float @llvm.fmuladd.f32(float %36, float %34, float 1.500000e+00)
  %38 = fmul float %37, %34
  %39 = fmul float %35, %38
  %40 = tail call float @llvm.fmuladd.f32(float %39, float %38, float 1.500000e+00)
  %41 = fmul float %38, %40
  %42 = fmul float %28, %41
  %43 = fneg float %19
  %44 = fsub float %43, %42
  %45 = fmul float %15, 2.000000e+00
  %46 = fdiv float %44, %45
  %47 = fcmp ogt float %46, 0x3EB0C6F7A0000000
  br i1 %47, label %53, label %48

48:                                               ; preds = %30
  %49 = fsub float %42, %19
  %50 = fdiv float %49, %45
  %51 = fcmp ogt float %50, 0x3EB0C6F7A0000000
  %52 = select i1 %51, float %50, float 0x46293E5940000000
  br label %53

53:                                               ; preds = %30, %48, %3
  %54 = phi float [ 0x46293E5940000000, %3 ], [ %46, %30 ], [ %52, %48 ]
  ret float %54
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none) uwtable
define dso_local i32 @trace(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #2 {
  %4 = load float, ptr @camera_x, align 4, !tbaa !5
  %5 = load float, ptr @sphere_x, align 4, !tbaa !5
  %6 = fsub float %4, %5
  %7 = load float, ptr @camera_y, align 4, !tbaa !5
  %8 = load float, ptr @sphere_y, align 4, !tbaa !5
  %9 = fsub float %7, %8
  %10 = load float, ptr @camera_z, align 4, !tbaa !5
  %11 = load float, ptr @sphere_z, align 4, !tbaa !5
  %12 = fsub float %10, %11
  %13 = fmul float %1, %1
  %14 = tail call float @llvm.fmuladd.f32(float %0, float %0, float %13)
  %15 = tail call float @llvm.fmuladd.f32(float %2, float %2, float %14)
  %16 = fmul float %9, %1
  %17 = tail call float @llvm.fmuladd.f32(float %6, float %0, float %16)
  %18 = tail call float @llvm.fmuladd.f32(float %12, float %2, float %17)
  %19 = fmul float %18, 2.000000e+00
  %20 = fmul float %9, %9
  %21 = tail call float @llvm.fmuladd.f32(float %6, float %6, float %20)
  %22 = tail call float @llvm.fmuladd.f32(float %12, float %12, float %21)
  %23 = load float, ptr @sphere_radius, align 4, !tbaa !5
  %24 = fneg float %23
  %25 = tail call float @llvm.fmuladd.f32(float %24, float %23, float %22)
  %26 = fmul float %15, -4.000000e+00
  %27 = fmul float %26, %25
  %28 = tail call float @llvm.fmuladd.f32(float %19, float %19, float %27)
  %29 = fcmp olt float %28, 0.000000e+00
  br i1 %29, label %130, label %30

30:                                               ; preds = %3
  %31 = bitcast float %28 to i32
  %32 = ashr i32 %31, 1
  %33 = sub nsw i32 1597463007, %32
  %34 = bitcast i32 %33 to float
  %35 = fmul float %28, -5.000000e-01
  %36 = fmul float %35, %34
  %37 = tail call float @llvm.fmuladd.f32(float %36, float %34, float 1.500000e+00)
  %38 = fmul float %37, %34
  %39 = fmul float %35, %38
  %40 = tail call float @llvm.fmuladd.f32(float %39, float %38, float 1.500000e+00)
  %41 = fmul float %38, %40
  %42 = fmul float %28, %41
  %43 = fneg float %19
  %44 = fsub float %43, %42
  %45 = fmul float %15, 2.000000e+00
  %46 = fdiv float %44, %45
  %47 = fcmp ogt float %46, 0x3EB0C6F7A0000000
  br i1 %47, label %52, label %48

48:                                               ; preds = %30
  %49 = fsub float %42, %19
  %50 = fdiv float %49, %45
  %51 = fcmp ogt float %50, 0x3EB0C6F7A0000000
  br i1 %51, label %52, label %130

52:                                               ; preds = %48, %30
  %53 = phi float [ %46, %30 ], [ %50, %48 ]
  %54 = fcmp ult float %53, 0x46293E5940000000
  br i1 %54, label %55, label %130

55:                                               ; preds = %52
  %56 = tail call float @llvm.fmuladd.f32(float %53, float %0, float %4)
  %57 = tail call float @llvm.fmuladd.f32(float %53, float %1, float %7)
  %58 = tail call float @llvm.fmuladd.f32(float %53, float %2, float %10)
  %59 = load float, ptr @light_x, align 4, !tbaa !5
  %60 = load float, ptr @light_y, align 4, !tbaa !5
  %61 = load float, ptr @light_z, align 4, !tbaa !5
  %62 = insertelement <2 x float> poison, float %56, i64 0
  %63 = insertelement <2 x float> %62, float %59, i64 1
  %64 = insertelement <2 x float> poison, float %5, i64 0
  %65 = insertelement <2 x float> %64, float %56, i64 1
  %66 = fsub <2 x float> %63, %65
  %67 = insertelement <2 x float> poison, float %57, i64 0
  %68 = insertelement <2 x float> %67, float %60, i64 1
  %69 = insertelement <2 x float> poison, float %8, i64 0
  %70 = insertelement <2 x float> %69, float %57, i64 1
  %71 = fsub <2 x float> %68, %70
  %72 = insertelement <2 x float> poison, float %58, i64 0
  %73 = insertelement <2 x float> %72, float %61, i64 1
  %74 = insertelement <2 x float> poison, float %11, i64 0
  %75 = insertelement <2 x float> %74, float %58, i64 1
  %76 = fsub <2 x float> %73, %75
  %77 = fmul <2 x float> %71, %71
  %78 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %66, <2 x float> %66, <2 x float> %77)
  %79 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %76, <2 x float> %76, <2 x float> %78)
  %80 = bitcast <2 x float> %79 to <2 x i32>
  %81 = ashr <2 x i32> %80, <i32 1, i32 1>
  %82 = sub nsw <2 x i32> <i32 1597463007, i32 1597463007>, %81
  %83 = bitcast <2 x i32> %82 to <2 x float>
  %84 = fmul <2 x float> %79, <float -5.000000e-01, float -5.000000e-01>
  %85 = fmul <2 x float> %84, %83
  %86 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %85, <2 x float> %83, <2 x float> <float 1.500000e+00, float 1.500000e+00>)
  %87 = fmul <2 x float> %86, %83
  %88 = fmul <2 x float> %84, %87
  %89 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %88, <2 x float> %87, <2 x float> <float 1.500000e+00, float 1.500000e+00>)
  %90 = fmul <2 x float> %87, %89
  %91 = fmul <2 x float> %79, %90
  %92 = extractelement <2 x float> %91, i64 0
  %93 = extractelement <2 x float> %66, i64 0
  %94 = fdiv float %93, %92
  %95 = extractelement <2 x float> %76, i64 0
  %96 = fdiv float %95, %92
  %97 = extractelement <2 x float> %91, i64 1
  %98 = extractelement <2 x float> %66, i64 1
  %99 = fdiv float %98, %97
  %100 = fdiv <2 x float> %71, %91
  %101 = extractelement <2 x float> %76, i64 1
  %102 = fdiv float %101, %97
  %103 = shufflevector <2 x float> %100, <2 x float> poison, <2 x i32> <i32 1, i32 poison>
  %104 = fmul <2 x float> %100, %103
  %105 = extractelement <2 x float> %104, i64 0
  %106 = tail call float @llvm.fmuladd.f32(float %94, float %99, float %105)
  %107 = tail call float @llvm.fmuladd.f32(float %96, float %102, float %106)
  %108 = fcmp olt float %107, 0.000000e+00
  %109 = select i1 %108, float 0.000000e+00, float %107
  %110 = tail call float @llvm.fmuladd.f32(float %109, float 0x3FECCCCCC0000000, float 0x3FB99999A0000000)
  %111 = load i32, ptr @sphere_alpha, align 4, !tbaa !9
  %112 = shl i32 %111, 24
  %113 = load i32, ptr @sphere_color_r, align 4, !tbaa !9
  %114 = sitofp i32 %113 to float
  %115 = fmul float %110, %114
  %116 = fptoui float %115 to i32
  %117 = shl i32 %116, 16
  %118 = load i32, ptr @sphere_color_g, align 4, !tbaa !9
  %119 = sitofp i32 %118 to float
  %120 = fmul float %110, %119
  %121 = fptoui float %120 to i32
  %122 = shl i32 %121, 8
  %123 = load i32, ptr @sphere_color_b, align 4, !tbaa !9
  %124 = sitofp i32 %123 to float
  %125 = fmul float %110, %124
  %126 = fptoui float %125 to i32
  %127 = or i32 %112, %126
  %128 = or i32 %127, %117
  %129 = or i32 %128, %122
  br label %130

130:                                              ; preds = %48, %3, %52, %55
  %131 = phi i32 [ %129, %55 ], [ -16777216, %52 ], [ -16777216, %3 ], [ -16777216, %48 ]
  ret i32 %131
}

; Function Attrs: nounwind uwtable
define dso_local void @render() local_unnamed_addr #3 {
  br label %1

1:                                                ; preds = %0, %9
  %2 = phi i32 [ 0, %0 ], [ %10, %9 ]
  %3 = sitofp i32 %2 to float
  %4 = fadd float %3, 5.000000e-01
  %5 = fdiv float %4, 7.680000e+02
  %6 = fsub float 5.000000e-01, %5
  %7 = fmul float %6, %6
  br label %12

8:                                                ; preds = %9
  ret void

9:                                                ; preds = %12
  %10 = add nuw nsw i32 %2, 1
  %11 = icmp eq i32 %10, 768
  br i1 %11, label %8, label %1, !llvm.loop !11

12:                                               ; preds = %1, %12
  %13 = phi i32 [ 0, %1 ], [ %37, %12 ]
  %14 = sitofp i32 %13 to float
  %15 = fadd float %14, 5.000000e-01
  %16 = fdiv float %15, 1.536000e+03
  %17 = fadd float %16, -5.000000e-01
  %18 = fmul float %17, 2.000000e+00
  %19 = tail call float @llvm.fmuladd.f32(float %18, float %18, float %7)
  %20 = fadd float %19, 1.000000e+00
  %21 = bitcast float %20 to i32
  %22 = ashr i32 %21, 1
  %23 = sub nsw i32 1597463007, %22
  %24 = bitcast i32 %23 to float
  %25 = fmul float %20, -5.000000e-01
  %26 = fmul float %25, %24
  %27 = tail call float @llvm.fmuladd.f32(float %26, float %24, float 1.500000e+00)
  %28 = fmul float %27, %24
  %29 = fmul float %25, %28
  %30 = tail call float @llvm.fmuladd.f32(float %29, float %28, float 1.500000e+00)
  %31 = fmul float %28, %30
  %32 = fmul float %20, %31
  %33 = fdiv float %18, %32
  %34 = fdiv float %6, %32
  %35 = fdiv float 1.000000e+00, %32
  %36 = tail call i32 @trace(float noundef %33, float noundef %34, float noundef %35)
  tail call void @simPutPixel(i32 noundef %13, i32 noundef %2, i32 noundef %36) #6
  %37 = add nuw nsw i32 %13, 1
  %38 = icmp eq i32 %37, 1536
  br i1 %38, label %9, label %12, !llvm.loop !13
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #3 {
  %1 = load i32, ptr @frames_per_rotation, align 4, !tbaa !9
  br label %2

2:                                                ; preds = %0, %457
  %3 = phi i32 [ %1, %0 ], [ %458, %457 ]
  %4 = phi i32 [ 0, %0 ], [ %459, %457 ]
  %5 = icmp sgt i32 %3, 0
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = sitofp i32 %4 to float
  %8 = load float, ptr @light_orbit_radius, align 4, !tbaa !5
  br label %14

9:                                                ; preds = %457
  ret void

10:                                               ; preds = %425, %2
  %11 = phi i32 [ %3, %2 ], [ %451, %425 ]
  %12 = and i32 %4, 1
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %455, label %453

14:                                               ; preds = %6, %425
  %15 = phi float [ %8, %6 ], [ %449, %425 ]
  %16 = phi i32 [ %3, %6 ], [ %451, %425 ]
  %17 = phi i32 [ 0, %6 ], [ %450, %425 ]
  %18 = sitofp i32 %17 to float
  %19 = fmul float %18, 0x401921FB60000000
  %20 = sitofp i32 %16 to float
  %21 = fdiv float %19, %20
  %22 = load float, ptr @sphere_x, align 4, !tbaa !5
  %23 = fadd float %21, 0x400921FB60000000
  %24 = bitcast float %23 to i32
  %25 = and i32 %24, 8388607
  %26 = and i32 %24, 2139095040
  %27 = icmp ne i32 %26, 2139095040
  %28 = icmp eq i32 %25, 0
  %29 = or i1 %27, %28
  br i1 %29, label %30, label %77

30:                                               ; preds = %14
  %31 = tail call float @llvm.fabs.f32(float %23)
  %32 = bitcast float %31 to i32
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %77, label %34

34:                                               ; preds = %30
  %35 = fdiv float %31, 0x401921FB60000000
  %36 = bitcast float %35 to i32
  %37 = and i32 %36, 8388607
  %38 = and i32 %36, 2139095040
  %39 = icmp ne i32 %38, 2139095040
  %40 = icmp eq i32 %37, 0
  %41 = or i1 %39, %40
  %42 = fcmp ult float %35, 0x4160000000000000
  %43 = and i1 %42, %41
  br i1 %43, label %44, label %63

44:                                               ; preds = %34
  %45 = fcmp olt float %35, 1.000000e+00
  br i1 %45, label %46, label %49

46:                                               ; preds = %44
  %47 = icmp sgt i32 %36, -1
  %48 = select i1 %47, float 0.000000e+00, float -1.000000e+00
  br label %63

49:                                               ; preds = %44
  %50 = lshr i32 %36, 23
  %51 = and i32 %50, 255
  %52 = sub nsw i32 150, %51
  %53 = shl nsw i32 -1, %52
  %54 = xor i32 %53, -1
  %55 = and i32 %54, %36
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %63, label %57

57:                                               ; preds = %49
  %58 = icmp sgt i32 %36, -1
  %59 = and i32 %53, %36
  %60 = bitcast i32 %59 to float
  br i1 %58, label %63, label %61

61:                                               ; preds = %57
  %62 = fadd float %60, -1.000000e+00
  br label %63

63:                                               ; preds = %61, %57, %49, %46, %34
  %64 = phi float [ %48, %46 ], [ %35, %34 ], [ %62, %61 ], [ %35, %49 ], [ %60, %57 ]
  %65 = fneg float %64
  %66 = tail call float @llvm.fmuladd.f32(float %65, float 0x401921FB60000000, float %31)
  %67 = fcmp olt float %66, 0.000000e+00
  %68 = fadd float %66, 0x401921FB60000000
  %69 = select i1 %67, float %68, float %66
  %70 = fcmp ult float %69, 0x401921FB60000000
  %71 = fadd float %69, 0xC01921FB60000000
  %72 = select i1 %70, float %69, float %71
  %73 = fneg float %72
  %74 = icmp slt i32 %24, 0
  %75 = select i1 %74, float %73, float %72
  %76 = fadd float %75, 0xC00921FB60000000
  br label %77

77:                                               ; preds = %14, %30, %63
  %78 = phi float [ %76, %63 ], [ 0x7FF8000000000000, %14 ], [ 0xC00921FB60000000, %30 ]
  %79 = tail call noundef float @llvm.fabs.f32(float %78)
  %80 = fcmp ogt float %79, 0x3FF921FB60000000
  %81 = fsub float 0x400921FB60000000, %79
  %82 = select i1 %80, float %81, float %79
  %83 = fneg float %82
  %84 = fmul float %82, %83
  %85 = fmul float %84, 5.000000e-01
  %86 = fadd float %85, 1.000000e+00
  %87 = fdiv float %84, 1.200000e+01
  %88 = fmul float %85, %87
  %89 = fadd float %86, %88
  %90 = fdiv float %84, 3.000000e+01
  %91 = fmul float %90, %88
  %92 = fadd float %89, %91
  %93 = fdiv float %84, 5.600000e+01
  %94 = fmul float %93, %91
  %95 = fadd float %92, %94
  %96 = fdiv float %84, 9.000000e+01
  %97 = fmul float %96, %94
  %98 = fadd float %95, %97
  %99 = fneg float %98
  %100 = select i1 %80, float %99, float %98
  %101 = tail call float @llvm.fmuladd.f32(float %15, float %100, float %22)
  store float %101, ptr @light_x, align 4, !tbaa !5
  %102 = load float, ptr @sphere_y, align 4, !tbaa !5
  %103 = load float, ptr @light_orbit_height, align 4, !tbaa !5
  %104 = fadd float %102, %103
  store float %104, ptr @light_y, align 4, !tbaa !5
  %105 = load float, ptr @sphere_z, align 4, !tbaa !5
  %106 = fadd float %21, 0xBFF921FB60000000
  %107 = fadd float %106, 0x400921FB60000000
  %108 = bitcast float %107 to i32
  %109 = and i32 %108, 8388607
  %110 = and i32 %108, 2139095040
  %111 = icmp ne i32 %110, 2139095040
  %112 = icmp eq i32 %109, 0
  %113 = or i1 %111, %112
  br i1 %113, label %114, label %161

114:                                              ; preds = %77
  %115 = tail call float @llvm.fabs.f32(float %107)
  %116 = bitcast float %115 to i32
  %117 = icmp eq i32 %116, 0
  br i1 %117, label %161, label %118

118:                                              ; preds = %114
  %119 = fdiv float %115, 0x401921FB60000000
  %120 = bitcast float %119 to i32
  %121 = and i32 %120, 8388607
  %122 = and i32 %120, 2139095040
  %123 = icmp ne i32 %122, 2139095040
  %124 = icmp eq i32 %121, 0
  %125 = or i1 %123, %124
  %126 = fcmp ult float %119, 0x4160000000000000
  %127 = and i1 %126, %125
  br i1 %127, label %128, label %147

128:                                              ; preds = %118
  %129 = fcmp olt float %119, 1.000000e+00
  br i1 %129, label %130, label %133

130:                                              ; preds = %128
  %131 = icmp sgt i32 %120, -1
  %132 = select i1 %131, float 0.000000e+00, float -1.000000e+00
  br label %147

133:                                              ; preds = %128
  %134 = lshr i32 %120, 23
  %135 = and i32 %134, 255
  %136 = sub nsw i32 150, %135
  %137 = shl nsw i32 -1, %136
  %138 = xor i32 %137, -1
  %139 = and i32 %138, %120
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %147, label %141

141:                                              ; preds = %133
  %142 = icmp sgt i32 %120, -1
  %143 = and i32 %137, %120
  %144 = bitcast i32 %143 to float
  br i1 %142, label %147, label %145

145:                                              ; preds = %141
  %146 = fadd float %144, -1.000000e+00
  br label %147

147:                                              ; preds = %145, %141, %133, %130, %118
  %148 = phi float [ %132, %130 ], [ %119, %118 ], [ %146, %145 ], [ %119, %133 ], [ %144, %141 ]
  %149 = fneg float %148
  %150 = tail call float @llvm.fmuladd.f32(float %149, float 0x401921FB60000000, float %115)
  %151 = fcmp olt float %150, 0.000000e+00
  %152 = fadd float %150, 0x401921FB60000000
  %153 = select i1 %151, float %152, float %150
  %154 = fcmp ult float %153, 0x401921FB60000000
  %155 = fadd float %153, 0xC01921FB60000000
  %156 = select i1 %154, float %153, float %155
  %157 = fneg float %156
  %158 = icmp slt i32 %108, 0
  %159 = select i1 %158, float %157, float %156
  %160 = fadd float %159, 0xC00921FB60000000
  br label %161

161:                                              ; preds = %77, %114, %147
  %162 = phi float [ %160, %147 ], [ 0x7FF8000000000000, %77 ], [ 0xC00921FB60000000, %114 ]
  %163 = tail call noundef float @llvm.fabs.f32(float %162)
  %164 = fcmp ogt float %163, 0x3FF921FB60000000
  %165 = fsub float 0x400921FB60000000, %163
  %166 = select i1 %164, float %165, float %163
  %167 = fneg float %166
  %168 = fmul float %166, %167
  %169 = fmul float %168, 5.000000e-01
  %170 = fadd float %169, 1.000000e+00
  %171 = fdiv float %168, 1.200000e+01
  %172 = fmul float %169, %171
  %173 = fadd float %170, %172
  %174 = fdiv float %168, 3.000000e+01
  %175 = fmul float %174, %172
  %176 = fadd float %173, %175
  %177 = fdiv float %168, 5.600000e+01
  %178 = fmul float %177, %175
  %179 = fadd float %176, %178
  %180 = fdiv float %168, 9.000000e+01
  %181 = fmul float %180, %178
  %182 = fadd float %179, %181
  %183 = fneg float %182
  %184 = select i1 %164, float %183, float %182
  %185 = tail call float @llvm.fmuladd.f32(float %15, float %184, float %105)
  store float %185, ptr @light_z, align 4, !tbaa !5
  br label %186

186:                                              ; preds = %193, %161
  %187 = phi i32 [ 0, %161 ], [ %194, %193 ]
  %188 = sitofp i32 %187 to float
  %189 = fadd float %188, 5.000000e-01
  %190 = fdiv float %189, 7.680000e+02
  %191 = fsub float 5.000000e-01, %190
  %192 = fmul float %191, %191
  br label %196

193:                                              ; preds = %196
  %194 = add nuw nsw i32 %187, 1
  %195 = icmp eq i32 %194, 768
  br i1 %195, label %223, label %186, !llvm.loop !11

196:                                              ; preds = %196, %186
  %197 = phi i32 [ 0, %186 ], [ %221, %196 ]
  %198 = sitofp i32 %197 to float
  %199 = fadd float %198, 5.000000e-01
  %200 = fdiv float %199, 1.536000e+03
  %201 = fadd float %200, -5.000000e-01
  %202 = fmul float %201, 2.000000e+00
  %203 = tail call float @llvm.fmuladd.f32(float %202, float %202, float %192)
  %204 = fadd float %203, 1.000000e+00
  %205 = bitcast float %204 to i32
  %206 = ashr i32 %205, 1
  %207 = sub nsw i32 1597463007, %206
  %208 = bitcast i32 %207 to float
  %209 = fmul float %204, -5.000000e-01
  %210 = fmul float %209, %208
  %211 = tail call float @llvm.fmuladd.f32(float %210, float %208, float 1.500000e+00)
  %212 = fmul float %211, %208
  %213 = fmul float %209, %212
  %214 = tail call float @llvm.fmuladd.f32(float %213, float %212, float 1.500000e+00)
  %215 = fmul float %212, %214
  %216 = fmul float %204, %215
  %217 = fdiv float %202, %216
  %218 = fdiv float %191, %216
  %219 = fdiv float 1.000000e+00, %216
  %220 = tail call i32 @trace(float noundef %217, float noundef %218, float noundef %219)
  tail call void @simPutPixel(i32 noundef %197, i32 noundef %187, i32 noundef %220) #6
  %221 = add nuw nsw i32 %197, 1
  %222 = icmp eq i32 %221, 1536
  br i1 %222, label %193, label %196, !llvm.loop !13

223:                                              ; preds = %193
  tail call void (...) @simFlush() #6
  %224 = load i32, ptr @sphere_color_b, align 4, !tbaa !9
  %225 = add nsw i32 %224, 3
  %226 = srem i32 %225, 255
  store i32 %226, ptr @sphere_color_b, align 4, !tbaa !9
  br i1 %29, label %227, label %274

227:                                              ; preds = %223
  %228 = tail call float @llvm.fabs.f32(float %23)
  %229 = bitcast float %228 to i32
  %230 = icmp eq i32 %229, 0
  br i1 %230, label %274, label %231

231:                                              ; preds = %227
  %232 = fdiv float %228, 0x401921FB60000000
  %233 = bitcast float %232 to i32
  %234 = and i32 %233, 8388607
  %235 = and i32 %233, 2139095040
  %236 = icmp ne i32 %235, 2139095040
  %237 = icmp eq i32 %234, 0
  %238 = or i1 %236, %237
  %239 = fcmp ult float %232, 0x4160000000000000
  %240 = and i1 %239, %238
  br i1 %240, label %241, label %260

241:                                              ; preds = %231
  %242 = fcmp olt float %232, 1.000000e+00
  br i1 %242, label %243, label %246

243:                                              ; preds = %241
  %244 = icmp sgt i32 %233, -1
  %245 = select i1 %244, float 0.000000e+00, float -1.000000e+00
  br label %260

246:                                              ; preds = %241
  %247 = lshr i32 %233, 23
  %248 = and i32 %247, 255
  %249 = sub nsw i32 150, %248
  %250 = shl nsw i32 -1, %249
  %251 = xor i32 %250, -1
  %252 = and i32 %251, %233
  %253 = icmp eq i32 %252, 0
  br i1 %253, label %260, label %254

254:                                              ; preds = %246
  %255 = icmp sgt i32 %233, -1
  %256 = and i32 %250, %233
  %257 = bitcast i32 %256 to float
  br i1 %255, label %260, label %258

258:                                              ; preds = %254
  %259 = fadd float %257, -1.000000e+00
  br label %260

260:                                              ; preds = %258, %254, %246, %243, %231
  %261 = phi float [ %245, %243 ], [ %232, %231 ], [ %259, %258 ], [ %232, %246 ], [ %257, %254 ]
  %262 = fneg float %261
  %263 = tail call float @llvm.fmuladd.f32(float %262, float 0x401921FB60000000, float %228)
  %264 = fcmp olt float %263, 0.000000e+00
  %265 = fadd float %263, 0x401921FB60000000
  %266 = select i1 %264, float %265, float %263
  %267 = fcmp ult float %266, 0x401921FB60000000
  %268 = fadd float %266, 0xC01921FB60000000
  %269 = select i1 %267, float %266, float %268
  %270 = fneg float %269
  %271 = icmp slt i32 %24, 0
  %272 = select i1 %271, float %270, float %269
  %273 = fadd float %272, 0xC00921FB60000000
  br label %274

274:                                              ; preds = %223, %227, %260
  %275 = phi float [ %273, %260 ], [ 0x7FF8000000000000, %223 ], [ 0xC00921FB60000000, %227 ]
  %276 = tail call noundef float @llvm.fabs.f32(float %275)
  %277 = fcmp ogt float %276, 0x3FF921FB60000000
  %278 = fsub float 0x400921FB60000000, %276
  %279 = select i1 %277, float %278, float %276
  %280 = fneg float %279
  %281 = fmul float %279, %280
  %282 = fmul float %281, 5.000000e-01
  %283 = fadd float %282, 1.000000e+00
  %284 = fdiv float %281, 1.200000e+01
  %285 = fmul float %282, %284
  %286 = fadd float %283, %285
  %287 = fdiv float %281, 3.000000e+01
  %288 = fmul float %287, %285
  %289 = fadd float %286, %288
  %290 = fdiv float %281, 5.600000e+01
  %291 = fmul float %290, %288
  %292 = fadd float %289, %291
  %293 = fdiv float %281, 9.000000e+01
  %294 = fmul float %293, %291
  %295 = fadd float %292, %294
  %296 = fneg float %295
  %297 = select i1 %277, float %296, float %295
  store float %297, ptr @camera_x, align 4, !tbaa !5
  br i1 %113, label %298, label %345

298:                                              ; preds = %274
  %299 = tail call float @llvm.fabs.f32(float %107)
  %300 = bitcast float %299 to i32
  %301 = icmp eq i32 %300, 0
  br i1 %301, label %345, label %302

302:                                              ; preds = %298
  %303 = fdiv float %299, 0x401921FB60000000
  %304 = bitcast float %303 to i32
  %305 = and i32 %304, 8388607
  %306 = and i32 %304, 2139095040
  %307 = icmp ne i32 %306, 2139095040
  %308 = icmp eq i32 %305, 0
  %309 = or i1 %307, %308
  %310 = fcmp ult float %303, 0x4160000000000000
  %311 = and i1 %310, %309
  br i1 %311, label %312, label %331

312:                                              ; preds = %302
  %313 = fcmp olt float %303, 1.000000e+00
  br i1 %313, label %314, label %317

314:                                              ; preds = %312
  %315 = icmp sgt i32 %304, -1
  %316 = select i1 %315, float 0.000000e+00, float -1.000000e+00
  br label %331

317:                                              ; preds = %312
  %318 = lshr i32 %304, 23
  %319 = and i32 %318, 255
  %320 = sub nsw i32 150, %319
  %321 = shl nsw i32 -1, %320
  %322 = xor i32 %321, -1
  %323 = and i32 %322, %304
  %324 = icmp eq i32 %323, 0
  br i1 %324, label %331, label %325

325:                                              ; preds = %317
  %326 = icmp sgt i32 %304, -1
  %327 = and i32 %321, %304
  %328 = bitcast i32 %327 to float
  br i1 %326, label %331, label %329

329:                                              ; preds = %325
  %330 = fadd float %328, -1.000000e+00
  br label %331

331:                                              ; preds = %329, %325, %317, %314, %302
  %332 = phi float [ %316, %314 ], [ %303, %302 ], [ %330, %329 ], [ %303, %317 ], [ %328, %325 ]
  %333 = fneg float %332
  %334 = tail call float @llvm.fmuladd.f32(float %333, float 0x401921FB60000000, float %299)
  %335 = fcmp olt float %334, 0.000000e+00
  %336 = fadd float %334, 0x401921FB60000000
  %337 = select i1 %335, float %336, float %334
  %338 = fcmp ult float %337, 0x401921FB60000000
  %339 = fadd float %337, 0xC01921FB60000000
  %340 = select i1 %338, float %337, float %339
  %341 = fneg float %340
  %342 = icmp slt i32 %108, 0
  %343 = select i1 %342, float %341, float %340
  %344 = fadd float %343, 0xC00921FB60000000
  br label %345

345:                                              ; preds = %274, %298, %331
  %346 = phi float [ %344, %331 ], [ 0x7FF8000000000000, %274 ], [ 0xC00921FB60000000, %298 ]
  %347 = tail call noundef float @llvm.fabs.f32(float %346)
  %348 = fcmp ogt float %347, 0x3FF921FB60000000
  %349 = fsub float 0x400921FB60000000, %347
  %350 = select i1 %348, float %349, float %347
  %351 = fneg float %350
  %352 = fmul float %350, %351
  %353 = fmul float %352, 5.000000e-01
  %354 = fadd float %353, 1.000000e+00
  %355 = fdiv float %352, 1.200000e+01
  %356 = fmul float %353, %355
  %357 = fadd float %354, %356
  %358 = fdiv float %352, 3.000000e+01
  %359 = fmul float %358, %356
  %360 = fadd float %357, %359
  %361 = fdiv float %352, 5.600000e+01
  %362 = fmul float %361, %359
  %363 = fadd float %360, %362
  %364 = fdiv float %352, 9.000000e+01
  %365 = fmul float %364, %362
  %366 = fadd float %363, %365
  %367 = fneg float %366
  %368 = select i1 %348, float %367, float %366
  store float %368, ptr @camera_y, align 4, !tbaa !5
  %369 = fmul float %21, %7
  %370 = fadd float %369, 0xBFF921FB60000000
  %371 = fadd float %370, 0x400921FB60000000
  %372 = bitcast float %371 to i32
  %373 = and i32 %372, 8388607
  %374 = and i32 %372, 2139095040
  %375 = icmp ne i32 %374, 2139095040
  %376 = icmp eq i32 %373, 0
  %377 = or i1 %375, %376
  br i1 %377, label %378, label %425

378:                                              ; preds = %345
  %379 = tail call float @llvm.fabs.f32(float %371)
  %380 = bitcast float %379 to i32
  %381 = icmp eq i32 %380, 0
  br i1 %381, label %425, label %382

382:                                              ; preds = %378
  %383 = fdiv float %379, 0x401921FB60000000
  %384 = bitcast float %383 to i32
  %385 = and i32 %384, 8388607
  %386 = and i32 %384, 2139095040
  %387 = icmp ne i32 %386, 2139095040
  %388 = icmp eq i32 %385, 0
  %389 = or i1 %387, %388
  %390 = fcmp ult float %383, 0x4160000000000000
  %391 = and i1 %390, %389
  br i1 %391, label %392, label %411

392:                                              ; preds = %382
  %393 = fcmp olt float %383, 1.000000e+00
  br i1 %393, label %394, label %397

394:                                              ; preds = %392
  %395 = icmp sgt i32 %384, -1
  %396 = select i1 %395, float 0.000000e+00, float -1.000000e+00
  br label %411

397:                                              ; preds = %392
  %398 = lshr i32 %384, 23
  %399 = and i32 %398, 255
  %400 = sub nsw i32 150, %399
  %401 = shl nsw i32 -1, %400
  %402 = xor i32 %401, -1
  %403 = and i32 %402, %384
  %404 = icmp eq i32 %403, 0
  br i1 %404, label %411, label %405

405:                                              ; preds = %397
  %406 = icmp sgt i32 %384, -1
  %407 = and i32 %401, %384
  %408 = bitcast i32 %407 to float
  br i1 %406, label %411, label %409

409:                                              ; preds = %405
  %410 = fadd float %408, -1.000000e+00
  br label %411

411:                                              ; preds = %409, %405, %397, %394, %382
  %412 = phi float [ %396, %394 ], [ %383, %382 ], [ %410, %409 ], [ %383, %397 ], [ %408, %405 ]
  %413 = fneg float %412
  %414 = tail call float @llvm.fmuladd.f32(float %413, float 0x401921FB60000000, float %379)
  %415 = fcmp olt float %414, 0.000000e+00
  %416 = fadd float %414, 0x401921FB60000000
  %417 = select i1 %415, float %416, float %414
  %418 = fcmp ult float %417, 0x401921FB60000000
  %419 = fadd float %417, 0xC01921FB60000000
  %420 = select i1 %418, float %417, float %419
  %421 = fneg float %420
  %422 = icmp slt i32 %372, 0
  %423 = select i1 %422, float %421, float %420
  %424 = fadd float %423, 0xC00921FB60000000
  br label %425

425:                                              ; preds = %345, %378, %411
  %426 = phi float [ %424, %411 ], [ 0x7FF8000000000000, %345 ], [ 0xC00921FB60000000, %378 ]
  %427 = tail call noundef float @llvm.fabs.f32(float %426)
  %428 = fcmp ogt float %427, 0x3FF921FB60000000
  %429 = fsub float 0x400921FB60000000, %427
  %430 = select i1 %428, float %429, float %427
  %431 = fneg float %430
  %432 = fmul float %430, %431
  %433 = fmul float %432, 5.000000e-01
  %434 = fadd float %433, 1.000000e+00
  %435 = fdiv float %432, 1.200000e+01
  %436 = fmul float %433, %435
  %437 = fadd float %434, %436
  %438 = fdiv float %432, 3.000000e+01
  %439 = fmul float %438, %436
  %440 = fadd float %437, %439
  %441 = fdiv float %432, 5.600000e+01
  %442 = fmul float %441, %439
  %443 = fadd float %440, %442
  %444 = fdiv float %432, 9.000000e+01
  %445 = fmul float %444, %442
  %446 = fadd float %443, %445
  %447 = fneg float %446
  %448 = select i1 %428, float %447, float %446
  %449 = fadd float %448, 4.000000e+00
  store float %449, ptr @light_orbit_radius, align 4, !tbaa !5
  %450 = add nuw nsw i32 %17, 1
  %451 = load i32, ptr @frames_per_rotation, align 4, !tbaa !9
  %452 = icmp slt i32 %450, %451
  br i1 %452, label %14, label %10, !llvm.loop !14

453:                                              ; preds = %10
  %454 = sdiv i32 %11, 2
  br label %457

455:                                              ; preds = %10
  %456 = shl nsw i32 %11, 1
  br label %457

457:                                              ; preds = %453, %455
  %458 = phi i32 [ %456, %455 ], [ %454, %453 ]
  store i32 %458, ptr @frames_per_rotation, align 4, !tbaa !9
  %459 = add nuw nsw i32 %4, 1
  %460 = icmp eq i32 %459, 100
  br i1 %460, label %9, label %2, !llvm.loop !15
}

declare void @simFlush(...) local_unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #5

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
