; ModuleID = 'raytracing.c'
source_filename = "raytracing.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@light_orbit_radius = dso_local local_unnamed_addr global float 4.000000e+00, align 4
@light_orbit_height = dso_local local_unnamed_addr global float 2.000000e+00, align 4
@frames_per_rotation = dso_local local_unnamed_addr global i32 60, align 4
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
  tail call void @simPutPixel(i32 noundef %13, i32 noundef %2, i32 noundef %36) #7
  %37 = add nuw nsw i32 %13, 1
  %38 = icmp eq i32 %37, 1536
  br i1 %38, label %9, label %12, !llvm.loop !13
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #3 {
  %1 = load i32, ptr @frames_per_rotation, align 4, !tbaa !9
  br label %2

2:                                                ; preds = %0, %84
  %3 = phi i32 [ %1, %0 ], [ %85, %84 ]
  %4 = phi i32 [ 0, %0 ], [ %86, %84 ]
  %5 = icmp sgt i32 %3, 0
  br i1 %5, label %6, label %10

6:                                                ; preds = %2
  %7 = sitofp i32 %4 to float
  %8 = load float, ptr @light_orbit_radius, align 4, !tbaa !5
  br label %14

9:                                                ; preds = %84
  ret void

10:                                               ; preds = %69, %2
  %11 = phi i32 [ %3, %2 ], [ %78, %69 ]
  %12 = and i32 %4, 1
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %82, label %80

14:                                               ; preds = %6, %69
  %15 = phi float [ %8, %6 ], [ %76, %69 ]
  %16 = phi i32 [ %3, %6 ], [ %78, %69 ]
  %17 = phi i32 [ 0, %6 ], [ %77, %69 ]
  %18 = sitofp i32 %17 to float
  %19 = fmul float %18, 0x401921FB60000000
  %20 = sitofp i32 %16 to float
  %21 = fdiv float %19, %20
  %22 = load float, ptr @sphere_x, align 4, !tbaa !5
  %23 = tail call fastcc float @cos_taylor(float noundef %21)
  %24 = tail call float @llvm.fmuladd.f32(float %15, float %23, float %22)
  store float %24, ptr @light_x, align 4, !tbaa !5
  %25 = load float, ptr @sphere_y, align 4, !tbaa !5
  %26 = load float, ptr @light_orbit_height, align 4, !tbaa !5
  %27 = fadd float %25, %26
  store float %27, ptr @light_y, align 4, !tbaa !5
  %28 = load float, ptr @sphere_z, align 4, !tbaa !5
  %29 = fadd float %21, 0xBFF921FB60000000
  %30 = tail call fastcc float @cos_taylor(float noundef %29)
  %31 = tail call float @llvm.fmuladd.f32(float %15, float %30, float %28)
  store float %31, ptr @light_z, align 4, !tbaa !5
  br label %32

32:                                               ; preds = %39, %14
  %33 = phi i32 [ 0, %14 ], [ %40, %39 ]
  %34 = sitofp i32 %33 to float
  %35 = fadd float %34, 5.000000e-01
  %36 = fdiv float %35, 7.680000e+02
  %37 = fsub float 5.000000e-01, %36
  %38 = fmul float %37, %37
  br label %42

39:                                               ; preds = %42
  %40 = add nuw nsw i32 %33, 1
  %41 = icmp eq i32 %40, 768
  br i1 %41, label %69, label %32, !llvm.loop !11

42:                                               ; preds = %42, %32
  %43 = phi i32 [ 0, %32 ], [ %67, %42 ]
  %44 = sitofp i32 %43 to float
  %45 = fadd float %44, 5.000000e-01
  %46 = fdiv float %45, 1.536000e+03
  %47 = fadd float %46, -5.000000e-01
  %48 = fmul float %47, 2.000000e+00
  %49 = tail call float @llvm.fmuladd.f32(float %48, float %48, float %38)
  %50 = fadd float %49, 1.000000e+00
  %51 = bitcast float %50 to i32
  %52 = ashr i32 %51, 1
  %53 = sub nsw i32 1597463007, %52
  %54 = bitcast i32 %53 to float
  %55 = fmul float %50, -5.000000e-01
  %56 = fmul float %55, %54
  %57 = tail call float @llvm.fmuladd.f32(float %56, float %54, float 1.500000e+00)
  %58 = fmul float %57, %54
  %59 = fmul float %55, %58
  %60 = tail call float @llvm.fmuladd.f32(float %59, float %58, float 1.500000e+00)
  %61 = fmul float %58, %60
  %62 = fmul float %50, %61
  %63 = fdiv float %48, %62
  %64 = fdiv float %37, %62
  %65 = fdiv float 1.000000e+00, %62
  %66 = tail call i32 @trace(float noundef %63, float noundef %64, float noundef %65)
  tail call void @simPutPixel(i32 noundef %43, i32 noundef %33, i32 noundef %66) #7
  %67 = add nuw nsw i32 %43, 1
  %68 = icmp eq i32 %67, 1536
  br i1 %68, label %39, label %42, !llvm.loop !13

69:                                               ; preds = %39
  tail call void (...) @simFlush() #7
  %70 = load i32, ptr @sphere_color_b, align 4, !tbaa !9
  %71 = add nsw i32 %70, 3
  %72 = srem i32 %71, 255
  store i32 %72, ptr @sphere_color_b, align 4, !tbaa !9
  %73 = fmul float %21, %7
  %74 = fadd float %73, 0xBFF921FB60000000
  %75 = tail call fastcc float @cos_taylor(float noundef %74)
  %76 = fadd float %75, 4.000000e+00
  store float %76, ptr @light_orbit_radius, align 4, !tbaa !5
  %77 = add nuw nsw i32 %17, 1
  %78 = load i32, ptr @frames_per_rotation, align 4, !tbaa !9
  %79 = icmp slt i32 %77, %78
  br i1 %79, label %14, label %10, !llvm.loop !14

80:                                               ; preds = %10
  %81 = sdiv i32 %11, 2
  br label %84

82:                                               ; preds = %10
  %83 = shl nsw i32 %11, 1
  br label %84

84:                                               ; preds = %80, %82
  %85 = phi i32 [ %83, %82 ], [ %81, %80 ]
  store i32 %85, ptr @frames_per_rotation, align 4, !tbaa !9
  %86 = add nuw nsw i32 %4, 1
  %87 = icmp eq i32 %86, 100
  br i1 %87, label %9, label %2, !llvm.loop !15
}

declare void @simFlush(...) local_unnamed_addr #4

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) uwtable
define internal fastcc float @cos_taylor(float noundef %0) unnamed_addr #5 {
  %2 = fadd float %0, 0x400921FB60000000
  %3 = bitcast float %2 to i32
  %4 = and i32 %3, 8388607
  %5 = and i32 %3, 2139095040
  %6 = icmp ne i32 %5, 2139095040
  %7 = icmp eq i32 %4, 0
  %8 = or i1 %6, %7
  br i1 %8, label %9, label %56

9:                                                ; preds = %1
  %10 = tail call float @llvm.fabs.f32(float %2)
  %11 = bitcast float %10 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %56, label %13

13:                                               ; preds = %9
  %14 = fdiv float %10, 0x401921FB60000000
  %15 = bitcast float %14 to i32
  %16 = and i32 %15, 8388607
  %17 = and i32 %15, 2139095040
  %18 = icmp ne i32 %17, 2139095040
  %19 = icmp eq i32 %16, 0
  %20 = or i1 %18, %19
  %21 = fcmp ult float %14, 0x4160000000000000
  %22 = and i1 %21, %20
  br i1 %22, label %23, label %42

23:                                               ; preds = %13
  %24 = fcmp olt float %14, 1.000000e+00
  br i1 %24, label %25, label %28

25:                                               ; preds = %23
  %26 = icmp sgt i32 %15, -1
  %27 = select i1 %26, float 0.000000e+00, float -1.000000e+00
  br label %42

28:                                               ; preds = %23
  %29 = lshr i32 %15, 23
  %30 = and i32 %29, 255
  %31 = sub nsw i32 150, %30
  %32 = shl nsw i32 -1, %31
  %33 = xor i32 %32, -1
  %34 = and i32 %33, %15
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %42, label %36

36:                                               ; preds = %28
  %37 = icmp sgt i32 %15, -1
  %38 = and i32 %32, %15
  %39 = bitcast i32 %38 to float
  br i1 %37, label %42, label %40

40:                                               ; preds = %36
  %41 = fadd float %39, -1.000000e+00
  br label %42

42:                                               ; preds = %13, %25, %28, %36, %40
  %43 = phi float [ %27, %25 ], [ %14, %13 ], [ %41, %40 ], [ %14, %28 ], [ %39, %36 ]
  %44 = fneg float %43
  %45 = tail call float @llvm.fmuladd.f32(float %44, float 0x401921FB60000000, float %10)
  %46 = fcmp olt float %45, 0.000000e+00
  %47 = fadd float %45, 0x401921FB60000000
  %48 = select i1 %46, float %47, float %45
  %49 = fcmp ult float %48, 0x401921FB60000000
  %50 = fadd float %48, 0xC01921FB60000000
  %51 = select i1 %49, float %48, float %50
  %52 = fneg float %51
  %53 = icmp slt i32 %3, 0
  %54 = select i1 %53, float %52, float %51
  %55 = fadd float %54, 0xC00921FB60000000
  br label %56

56:                                               ; preds = %1, %9, %42
  %57 = phi float [ %55, %42 ], [ 0x7FF8000000000000, %1 ], [ 0xC00921FB60000000, %9 ]
  %58 = tail call noundef float @llvm.fabs.f32(float %57)
  %59 = fcmp ogt float %58, 0x3FF921FB60000000
  %60 = fsub float 0x400921FB60000000, %58
  %61 = select i1 %59, float %60, float %58
  %62 = fneg float %61
  %63 = fmul float %61, %62
  %64 = fmul float %63, 5.000000e-01
  %65 = fadd float %64, 1.000000e+00
  %66 = fdiv float %63, 1.200000e+01
  %67 = fmul float %64, %66
  %68 = fadd float %65, %67
  %69 = fdiv float %63, 3.000000e+01
  %70 = fmul float %67, %69
  %71 = fadd float %68, %70
  %72 = fdiv float %63, 5.600000e+01
  %73 = fmul float %70, %72
  %74 = fadd float %71, %73
  %75 = fdiv float %63, 9.000000e+01
  %76 = fmul float %73, %75
  %77 = fadd float %74, %76
  %78 = fneg float %77
  %79 = select i1 %59, float %78, float %77
  ret float %79
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #6

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { nounwind }

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
