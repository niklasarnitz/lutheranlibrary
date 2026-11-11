\version "2.24.3"
% Lochner scan 170, Parallel Latin and German Collecte, printed pp. 145–146.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 115\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 1\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }

shortBar = { \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar "," }

\score {
  <<
    \new Staff {
      \new Voice = "chant" {
        \clef bass \cadenzaOn
        f2 f2 \shortBar f2 \shortBar f2 f4 f2 f2 \shortBar f2 f2 \bar "|" f2 f2 f4 f2 f2 \bar "" \break
        f2 f2 \shortBar f2 \shortBar f2 \shortBar f2 f2 f4 f2 \shortBar f2 \bar "|" f2 f2 f2 f4 f2 f2 \bar "" \break
        f2 f2 f2 \shortBar f2 f2 \bar "|" f2 f2 f2 \bar "|" f2 f2 f4 \shortBar f2 ^\markup \tiny "Hauptpunkt." e2 c2 f2 f2 \bar "" \break
        f2 f2 \shortBar f2 f2 f2 f2 f2 \shortBar f2 \shortBar f2 f2 \shortBar e2 c2 f2 f2 \bar "" \break
        f2 \shortBar f2 f2 f4 f2 \shortBar f2 f2 \shortBar f2 f2 f2 \shortBar f2 \shortBar f2 f4 f2 \bar "" \break
        f4 f2 f2 \shortBar f2 f2 f2 f2 \shortBar f4 f2 f2 \shortBar f2 f2 f2 \shortBar f2 f4 f2 f2 \bar "" \break
        f2 f2 \shortBar f2 ^\markup \tiny "Halbpunkt." f2 e2 \bar "|" f2 \shortBar f2 \shortBar f2 f2 f4 f2 f2 f2 f2 \bar "" \break
        f2 f2 \shortBar f2 f4 f2 e2 \bar "|" f2 f2 f2 f2 f2 f2 f4 \shortBar f2 f2 \bar ""
      }
    }
    \new Lyrics \lyricsto "chant" {
      De -- us, qui ho -- di -- er -- nam di -- em A -- po -- sto -- lo -- rum
      O Gott, der du den heu -- ti -- gen Tag durch das To -- des -- lei -- den
      tu -- o -- rum Pe -- tri et Pau -- li mar -- ty -- ri -- o con -- se -- cra -- sti:
      dei -- ner A -- po -- stel Pe -- trus und Pau -- lus hast ge -- wei -- het:
      da Ec -- cle -- si -- ae tu -- ae e -- o -- rum in om -- ni -- bus
      ver -- lei -- he dei -- ner Kir -- che, in al -- len Din -- gen der Un -- ter -- wei -- sung
      se -- qui prae -- cep -- tum: per quos re -- li -- gi -- o -- nis fu -- it
      be -- rer nach -- zu -- fol -- gen, durch wel -- che der Glau -- be den An -- fang
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
