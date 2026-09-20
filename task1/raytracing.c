#include "sim.h"
#include "mymath.h"


#define MISS 1e30f

const unsigned int BACKGROUND = 0xFF000000u;

const float AMBIENT = 0.1f;
float light_orbit_radius = 4.0f;
float light_orbit_height = 2.0f;
// basicly the speed of the lightsource
int frames_per_rotation = 60;

const int ROTATIONS = 100;

const float WINDOW_WIDTH = (float)SIM_X_SIZE / (float)SIM_Y_SIZE;
const float WINDOW_HEIGHT = 1.0f;
const float WINDOW_DISTANCE = 1.0f;

int sphere_color_r = 0x00;
int sphere_color_g = 0xF0;
int sphere_color_b = 0x00;
int sphere_alpha = 0xFF;

float sphere_radius = 1.0f;

float sphere_x = 0.0f;
float sphere_y = 0.0f;
float sphere_z = 4.0f;

float camera_x = 0.0f;
float camera_y = 0.0f;
float camera_z = 0.0f;

// position of the light source, updated once per frame
float light_x = 0.0f;
float light_y = 0.0f;
float light_z = 0.0f;


float norm_factor(const float x, const float y, const float z) {
    return sqrt(x * x + y * y + z * z);
}


unsigned int shade(const float hit_x, const float hit_y, const float hit_z) {
    // calculate normale pointing away from sphere's center
    float normale_x = hit_x - sphere_x;
    float normale_y = hit_y - sphere_y;
    float normale_z = hit_z - sphere_z;

    float norm = norm_factor(normale_x, normale_y, normale_z);

    normale_x /= norm;
    normale_y /= norm;
    normale_z /= norm;
    // calculated.

    // calculate vector from hit towards lightsource
    float to_light_x = light_x - hit_x;
    float to_light_y = light_y - hit_y;
    float to_light_z = light_z - hit_z;

    norm = norm_factor(to_light_x, to_light_y, to_light_z);

    to_light_x /= norm;
    to_light_y /= norm;
    to_light_z /= norm;
    // calculated.

    float brightness = normale_x * to_light_x + normale_y * to_light_y + normale_z * to_light_z;

    if (brightness < 0.0f)
        brightness = 0.0f;

    const float intensity = AMBIENT + (1.0f - AMBIENT) * brightness;

    unsigned int result_color = (unsigned int)sphere_alpha << 24;
    result_color |= (unsigned int)(sphere_color_r * intensity) << 16;
    result_color |= (unsigned int)(sphere_color_g * intensity) << 8;
    result_color |= (unsigned int)(sphere_color_b * intensity);

    return result_color;
}


float intersect_sphere(const float dir_x, const float dir_y, const float dir_z) {
    // vector from sphere's center towards the camera
    const float o_x = camera_x - sphere_x;
    const float o_y = camera_y - sphere_y;
    const float o_z = camera_z - sphere_z;

    // quadratic equation ahead, direction is already normalized, so a = 1
    // just in case, a = dot(dir, dir)
    const float a = dir_x * dir_x + dir_y * dir_y + dir_z * dir_z;
    const float b = 2.0f * (o_x * dir_x + o_y * dir_y + o_z * dir_z);
    const float c = (o_x * o_x + o_y * o_y + o_z * o_z) - sphere_radius * sphere_radius;
    const float D = b * b - 4.0f * a * c;

    if (D < 0.0f)
        return MISS;

    const float sqrt_D = sqrt(D);

    float t = (-b - sqrt_D) / (2.0f * a);
    if (t > EPS)
        return t;

    t = (-b + sqrt_D) / (2.0f * a);
    if (t > EPS)
        return t;

    return MISS;
}


unsigned int trace(const float ray_dir_x, const float ray_dir_y, const float ray_dir_z) {
    const float t = intersect_sphere(ray_dir_x, ray_dir_y, ray_dir_z);

    if (t >= MISS)
        return BACKGROUND;

    const float hit_x = camera_x + t * ray_dir_x;
    const float hit_y = camera_y + t * ray_dir_y;
    const float hit_z = camera_z + t * ray_dir_z;

    return shade(hit_x, hit_y, hit_z);
}


void render() {
    float ray_dir_x;
    float ray_dir_y;
    float ray_dir_z;

    for (int py = 0; py < SIM_Y_SIZE; py++) {
        for (int px = 0; px < SIM_X_SIZE; px++) {

            ray_dir_z = WINDOW_DISTANCE;
            float u = (px + 0.5f) / SIM_X_SIZE;
            float v = (py + 0.5f) / SIM_Y_SIZE;

            ray_dir_x = (u - 0.5f) * WINDOW_WIDTH;
            ray_dir_y = (0.5f - v) * WINDOW_HEIGHT;

            float norm = norm_factor(ray_dir_x, ray_dir_y, ray_dir_z);
            ray_dir_x /= norm;
            ray_dir_y /= norm;
            ray_dir_z /= norm;

            unsigned int color = trace(ray_dir_x, ray_dir_y, ray_dir_z);

            simPutPixel(px, py, color);
        }
    }
}


void app() {
    for (int i = 0; i < ROTATIONS; i++) {
        for (int frame = 0; frame < frames_per_rotation; frame++) {
            float angle = 2.0f * PI * frame / frames_per_rotation;

            light_x = sphere_x + light_orbit_radius * cos(angle);
            light_y = sphere_y + light_orbit_height;
            light_z = sphere_z + light_orbit_radius * sin(angle);

            render();
            simFlush();

            sphere_color_b += 3;
            sphere_color_b = sphere_color_b % 255;
            
            camera_x = WINDOW_DISTANCE * cos(angle);
            camera_y = WINDOW_DISTANCE * sin(angle);

            light_orbit_radius = 4.0f + sin(i * angle);
        }

        if (i % 2)
            frames_per_rotation /= 2;
        else
            frames_per_rotation *= 2;
    }
}