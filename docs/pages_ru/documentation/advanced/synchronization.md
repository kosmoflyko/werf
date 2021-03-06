---
title: Синхронизация в werf
sidebar: documentation
permalink: documentation/advanced/synchronization.html
---

Синхронизация — это группа сервисных компонентов werf, предназначенных для координации нескольких процессов werf при выборке и сохранении стадий в хранилище, а также при публикации образов в репозиторий образов. Существует 2 таких компонента для синхронизации:

 1. _Кеш хранилища_ — это внутренний служебный кеш werf, который существенно повышает производительность фазы рассчёта стадий в случае, если эти стадии уже есть в хранилище. Кеш хранилища содержит соответствие существующих в хранилище с дайджестом (или другими словами: содержит предварительно расчитанный шаг алгоритма выборки стадий по дайджесту). Данный кеш является когерентным и werf автоматически сбрасывает его, если будет замечена несостыковка между хранилищем стадий и кешом хранилища.
 2. _Менеджер блокировок_. Блокировки требуются для корректной публикации новых стадий в хранилище, публикации новых образов в репозиторий образов и для организации параллельных процессов выката в Kubernetes (блокируется имя релиза).

Все команды, использующие параметры хранилища (`--repo=...`) также требуют указания адреса менеджера блокировок, который задается опцией `--synchronization=...` или переменной окружения `WERF_SYNCHRONIZATION=...`.

Существует 2 типа наборов компонентов для синхронизации:
 1. Локальный. Включается опцией `--synchronization=:local`.
   - Локальный _кеш хранилища_ располагается по умолчанию в файлах `~/.werf/shared_context/storage/stages_storage_cache/1/PROJECT_NAME/DIGEST`, каждый из которых хранит соответствие существующих в хранилище по некоторому дайджесту.
   - Локальный _менеджер блокировок_ использует файловые блокировки, предоставляемые операционной системой.
 2. Kubernetes. Включается опцией `--synchronization=kubernetes://NAMESPACE[:CONTEXT][@(base64:CONFIG_DATA)|CONFIG_PATH]`.
  - _Кеш хранилища_ в Kubernetes использует для каждого проекта отдельный ConfigMap `cm/PROJECT_NAME`, который создается в указанном `NAMESPACE`.
  - _Менеджер блокировок_ в Kubernetes использует ConfigMap по имени проекта `cm/PROJECT_NAME` (тот же самый что и для кеша хранилища) для хранения распределённых блокировок в аннотациях этого ConfigMap. Werf использует [библиотека lockgate](https://github.com/werf/lockgate), которая реализует распределённые блокировки с помощью обновления аннотаций в ресурсах Kubernetes.
 3. Http. Включается опцией `--synchronization=http[s]://DOMAIN`.
  - Есть публичный сервер синхронизации доступный по домену `https://synchronization.werf.io`.
  - Собственный http сервер синхронизации может быть запущен командой `werf synchronization`. 

Werf использует `--synchronization=:local` (локальный _кеш хранилища_ и локальный _менеджер блокировок_) по умолчанию, если используется локальное хранилище.

Werf использует `--synchronization=https://synchronization.werf.io` по умолчанию, если используется удалённое хранилище (`--repo=DOCKER_REPO_ADDRESS`).

Пользователь может принудительно указать произвольный адрес компонентов для синхронизации, если это необходимо, с помощью явного указания опции `--synchronization=:local|(kubernetes://NAMESPACE[:CONTEXT][@(base64:CONFIG_DATA)|CONFIG_PATH])|(http[s]://DOMAIN)`.

**ЗАМЕЧАНИЕ:** Множество процессов werf, работающих с одним и тем же проектом обязаны использовать одинаковое хранилище и адрес набора компонентов синхронизации.
