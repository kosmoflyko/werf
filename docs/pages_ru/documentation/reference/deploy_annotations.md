---
title: Аннотации для деплоя
permalink: documentation/reference/deploy_annotations.html
sidebar: documentation
toc: false
---

Данная статья содержит описание аннотаций, которые меняют поведение механизма отслеживания ресурсов в процессе выката с помощью werf. Все аннотации должны быть объявлены в шаблонах чарта.

 - [`werf.io/track-termination-mode`](#track-termination-mode) — определяет условие при котором werf остановит отслеживание ресурса.
 - [`werf.io/fail-mode`](#fail-mode) — определяет как werf обработает ресурс в состоянии ошибки. Ресурс в свою очередь перейдет в состояние ошибки после превышения порога допустимых ошибок, обнаруженных при отслеживании этого ресурса в процессе выката.
 - [`werf.io/failures-allowed-per-replica`](#failures-allowed-per-replica) — определяет порог ошибок, обнаруживаемых при отслеживании этого ресурса в процессе выката, после превышения которого ресурс перейдет в состояние ошибки. Werf обработает это состояние в соответствии с настройкой [fail mode](#fail-mode).
 - [`werf.io/log-regex`](#log-regex) — показывать в логах только те строки вывода ресурса, которые подходят под указанный шаблон.
 - [`werf.io/log-regex-for-CONTAINER_NAME`](#log-regex-for-container) — показывать в логах только те строки вывода для указанного контейнера, которые подходят под указанный шаблон.
 - [`werf.io/skip-logs`](#skip-logs) — выключить логирование вывода для ресурса.
 - [`werf.io/skip-logs-for-containers`](#skip-logs-for-containers) — выключить логирование вывода для указанного контейнера.
 - [`werf.io/show-logs-only-for-containers`](#show-logs-only-for-containers) — включить логирование вывода только для указанных контейнеров ресурса.
 - [`werf.io/show-service-messages`](#show-service-messages) — включить вывод сервисных сообщений и событий Kubernetes для данного ресурса.

Больше информации о том, что такое чарт, шаблоны и пр. доступно в [базовой статье о деплое]({{ "documentation/advanced/helm/basics.html" | true_relative_url }}).

## Track termination mode

`"werf.io/track-termination-mode": WaitUntilResourceReady|NonBlocking`

Определяет условие остановки отслеживания ресурса в процессе деплоя:
 * `WaitUntilResourceReady` (по умолчанию) — весь процесс деплоя будет отслеживать и ожидать готовности ресурса с данной аннотацией. Т.к. данный режим включен по умолчанию, то, по умолчанию, процесс деплоя ждет готовности всех ресурсов.
 * `NonBlocking` — ресурс с данной аннотацией отслеживается только пока есть другие ресурсы, готовности которых ожидает процесс деплоя.

<img src="https://raw.githubusercontent.com/werf/demos/master/deploy/werf-new-track-modes-3.gif" />

**СОВЕТ** Используйте аннотации — `"werf.io/track-termination-mode": NonBlocking` и `"werf.io/fail-mode": IgnoreAndContinueDeployProcess`, когда описываете в релизе объект Job, который должен быть запущен в фоне и не влияет на процесс деплоя.

**СОВЕТ** Используйте аннотацию `"werf.io/track-termination-mode": NonBlocking`, когда описываете в релизе объект StatefulSet с ручной стратегией выката (параметр `OnDelete`) и не хотите блокировать весь процесс деплоя из-за этого объекта, дожидаясь его обновления.

## Fail mode

`"werf.io/fail-mode": FailWholeDeployProcessImmediately|HopeUntilEndOfDeployProcess|IgnoreAndContinueDeployProcess`

Определяет как werf будет обрабатывать ресурс в состоянии ошибки, которое возникает после превышения порога ошибок, возникающих во время отслеживания данного ресурса в процессе деплоя:
 * `FailWholeDeployProcessImmediately` (по умолчанию) — в случае ошибки при деплое ресурса с данной аннотацией, весь процесс деплоя будет завершен с ошибкой.
 * `HopeUntilEndOfDeployProcess` — в случае ошибки при деплое ресурса с данной аннотацией его отслеживание будет продолжаться, пока есть другие ресурсы, готовности которых ожидает процесс деплоя, либо все оставшиеся ресурсы имеют такую-же аннотацию. Если с ошибкой остался только этот ресурс или несколько ресурсов с такой-же аннотацией, то в случае сохранения ошибки весь процесс деплоя завершается с ошибкой.
 * `IgnoreAndContinueDeployProcess` — ошибка при деплое ресурса с данной аннотацией не влияет на весь процесс деплоя.

## Failures allowed per replica

`"werf.io/failures-allowed-per-replica": "NUMBER"`

По умолчанию, при отслеживании статуса ресурса допускается срабатывание ошибки 1 раз, прежде чем весь процесс деплоя считается ошибочным. Этот параметр влияет на поведение настройки [Fail mode](#fail-mode): определяет порог срабатывания, после которого начинает работать режим реакции на ошибки.

## Log regex

`"werf.io/log-regex": RE2_REGEX`

Определяет [Re2 regex](https://github.com/google/re2/wiki/Syntax) шаблон, применяемый ко всем логам всех контейнеров всех подов ресурса с этой аннотацией. werf будет выводить только те строки лога, которые удовлетворяют regex-шаблону. По умолчанию werf выводит все строки лога.

## Log regex for container

`"werf.io/log-regex-for-CONTAINER_NAME": RE2_REGEX`

Определяет [Re2 regex](https://github.com/google/re2/wiki/Syntax) шаблон, применяемый к логам контейнера с именем `CONTAINER_NAME` всех подов с данной аннотацией. werf будет выводить только те строки лога, которые удовлетворяют regex-шаблону. По умолчанию werf выводит все строки лога.

## Skip logs

`"werf.io/skip-logs": "true"|"false"`

Если установлена в `"true"`, то логи всех контейнеров пода с данной аннотацией не выводятся при отслеживании. Отключено по умолчанию.

<img src="https://raw.githubusercontent.com/werf/demos/master/deploy/werf-new-track-modes-2.gif" />

## Skip logs for containers

`"werf.io/skip-logs-for-containers": CONTAINER_NAME1,CONTAINER_NAME2,CONTAINER_NAME3...`

Список (через запятую) контейнеров пода с данной аннотацией, для которых логи не выводятся при отслеживании.

## Show logs only for containers

`"werf.io/show-logs-only-for-containers": CONTAINER_NAME1,CONTAINER_NAME2,CONTAINER_NAME3...`

Список (через запятую) контейнеров пода с данной аннотацией, для которых выводятся логи при отслеживании. Для контейнеров, чьи имена отсутствуют в списке, логи не выводятся. По умолчанию выводятся логи для всех контейнеров всех подов ресурса.

## Show service messages

`"werf.io/show-service-messages": "true"|"false"`

Если установлена в `"true"`, то при отслеживании для ресурсов будет выводиться дополнительная отладочная информация, такая как события Kubernetes. По умолчанию, werf выводит такую отладочную информацию только в случае если ошибка ресурса приводит к ошибке всего процесса деплоя.

<img src="https://raw.githubusercontent.com/werf/demos/master/deploy/werf-new-track-modes-1.gif" />
