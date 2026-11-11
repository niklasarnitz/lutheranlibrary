\version "2.24.3"
% Lochner, II. Sanctus minus summum. Source pages 219–220.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key f \major \time 4/4 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne a'2 g'4( a'4) \bar "|" f'2( g'2) \bar "|" f'2 r4 f'4^\markup \tiny "Gemeinde." \bar "|"
      \grace a'8 a'2 \grace a'8 g'2 \bar "|" c''2 c''4 d''4 \bar "|" c''2 a'2 \bar "|" }
      \new Voice = "alto" { \voiceTwo f'2 g'4( f'4) c'4( d'4 e'2) f'2 s4 f'4 f'2 e'2 e'2 f'4 f'4 e'2 f'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t in der \skip 1 Hö \skip 1 "he!" Ge -- lo -- bet "sei," der da "kommt," im }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne c'2 c'2 a2( c'2) c'2 r4 a4 c'2 c'2 c'2 c'4 bes4 g2 d'2 }
      \new Voice = "bass" { \voiceTwo f2 e4( f4) f2( c2) f2 s4 f4 f2 c2 a,2 a,4 bes,4 c2 d2 }
    >>
  \new Lyrics \lyricsto "bass" { \set ignoreMelismata = ##t \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 Ge -- bene -- deit }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
